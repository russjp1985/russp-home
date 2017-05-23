<?php

class Option {

    private $isRequired  = false;
    private $symbol      = false;
    private $flag        = true;
    private $default     = false;
    private $description = "";

    public function __construct($symbol) {
        $this->symbol = $symbol;
        return $this;
    }

    public function description($text) {
        $this->description = $text;
        return $this;
    }

    public function takesArgument() {
        $this->flag = false;
        return $this;
    }

    public function required() {
        $this->isRequired = true;
        return $this;
    }

    public function isFlag() : bool {
        return !!$this->flag;
    }

    public function isRequired() : bool {
        return !!$this->isRequired;
    }

    public function default($value) {
        $this->default = $value;
        return $this;
    }

    public function getOptionString() {
        $tag = ($this->flag ? "" : ":");
        return $this->symbol . $tag;
    }

    public function getUsageString() {
        $parts = ["-{$this->symbol}"];
        $parts[] = $this->flag ? "            " : "<option>    ";
        $parts[] = $this->description;
        $parts[] = $this->isRequired ? "(required)" : "";
        return implode($parts, " ");
    }

    public function getDefault() {
        return $this->default;
    }
}

class Script {

    const HELP_SYMBOL = 'h';

    private $symbols = [];

    public function __construct() {
        $this->addOption(self::HELP_SYMBOL)->description("Show usage information");
    }

    public function addOption(string $symbol) : Option {
        if (isset($this->symbols[$symbol])) {
            $this->fatal("Cannot use symbol: {$symbol} as an argument, it has already been used!");
        }
        $this->symbols[$symbol] = new Option($symbol);
        return $this->symbols[$symbol];
    }

    private function fatal($string) {
        echo "fatal: $string\n";
        $this->usage();
        $this->exit(1);
    }

    private function usage() {
        foreach ($this->symbols as $option) {
            echo $option->getUsageString()."\n";
        }
    }

    private function exit(int $exit_code) {
        exit($exit_code);
    }

    public function run(callable $executable) {
        $opts = $this->processArguments();
        $return_code = 0;
        $context = new ScriptContext($opts);
        try {
            $return_code = $executable($context);
        } catch (Catchable $e) {
            $this->fatal($e->getMessage());
        }
        $this->exit($return_code || 0);
    }

    private function processArguments() {
        $strings = [self::HELP_SYMBOL];
        foreach ($this->symbols as $symbol => $option) {
            $strings[] = $option->getOptionString();
        }
        $option_string = implode('', $strings);
        $opts = getopt($option_string);
        if (isset($opts['h'])) {
            $this->usage();
            $this->exit(0);
        }
        foreach ($this->symbols as $symbol => $option) {
            if ($option->isRequired() && empty($opts[$symbol])) {
                $this->fatal("Missing required argument: $symbol");
            }

            if (!$option->isFlag() && !$option->isRequired()) {
                $opts[$symbol] = $option->getDefault();
            }
            if ($option->isFlag()) {
                $opts[$symbol] = isset($opts[$symbol]);
            }
        }
        return $opts;
    }
}

class ScriptContext {

    public function getOption(string $symbol) {
        if (!isset($this->options[$symbol])) {
            throw new Exception("No option named $symbol!");
        }
        return $this->options[$symbol];
    }

    public function log($string) {
        echo $string."\n";
    }

    public function __construct(array $options) {
        $this->options = $options;
    }

}

$script = new Script();
$script->addOption('f')->takesArgument()->required()->description("File name where you write the new component class");
$script->addOption('c')->takesArgument()->description("Class name for new component. If not provided, uses the basename of the file path");
$script->run(function($context) {
    $context->log("hello world");
    $filename = $context->getOption('f');
    $context->log("Writing filename $filename");
    return 0;
});
