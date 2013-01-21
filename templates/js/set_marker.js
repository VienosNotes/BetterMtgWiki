var links = window.document.getElementsByTagName("a");

var len = links.length;
for (var i = 0; i < len; ++i) {
    if (links[i].innerText.indexOf('/') != -1) {            

        try {
            standards.forEach(function (name) {
                if (links[i].innerText.match(name)) {
                    console.log(links[i].innerText);
                    links[i].setAttribute("style","text-shadow: 1px 1px 5px #FA4");
                    throw "";
                }
            });
        } catch (e) {};
    }
}
