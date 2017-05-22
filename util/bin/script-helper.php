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

    public function option() {
        $this->flag = false;
        return $this;
    }

    public function required() {
        $this->required = true;
        return $this;
    }

    public function default($value) {
        $this->default = $value;
        return $this;
    }

    public function getOptionString() {
        $tag = ($this->flag ? "" : ":");
        return $symbol . $tag;
    }

    public function getUsageString() {
        $parts = ["-{$this->symbol}"];
        $parts[] = $this->flag ? " " : "<option>";
        $parts[] = $this->description;
        $parts[] = $this->required ? "(required)";
        return implode($parts, " ");
    }
}

class Script {

    private $symbols = [];

    public function option($symbol) {

    }
}


