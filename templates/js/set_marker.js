var links = window.document.getElementsByTagName("a");

var len = links.length;
for (var i = 0; i < len; ++i) {
    if (links[i].innerText.indexOf('/') != -1) {            

        try {
            standards.forEach(function (name) {
//                console.log(links[i].innerText.slice(links[i].innerText.lastIndexOf('/')+1));
                var slashed = links[i].innerText.split(/\s*\/\s*/);
//
                if (slashed[0] == name || slashed[1] == name) {
                console.log(slashed);
                    links[i].setAttribute("style","text-shadow: 1px 1px 5px #FA4");
                    throw "";
                }
            });
        } catch (e) {};
    }
}
