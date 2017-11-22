var odds = function(d, m) {
    if (!m) {
        m = { 0 : 1}
    }
    var i = 1, oddMap = {};
    while (i <= d) {
        for (var k in m) {
            var sum = parseInt(i) + parseInt(k);
            if (oddMap[sum]) {
                var add = oddMap[sum];
            } else {
               add = 0;
            }
            oddMap[sum] = m[k]*(1/d) + add;
        }
        i++;
    }
    var total = 0;
    for (var j in oddMap) {
        total += oddMap[j];
    }
    if (total !== 1) {
        console.error("ERROR: Odds must equal 1");
    }
    console.log(oddMap);

    return oddMap;
}
