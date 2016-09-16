$(document).ready(function () {
    function getUrlVars() {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }

    // get categories
    function GetCategories() {


        $.ajax({

            url: "api/categories"

        }).done(function (data) {

            console.log(data);
            $.each(data, function (key, item) {
                if (item.Events.length != 0) {

                    var html = '<div class="row">\
                                <div class="col-md-6 Musik"><p>' + item.Name + '</p></div>\
                                <div class="col-md-6 sealle"><a href="#">Se alle</a></div>\
                             </div>';

                    html += '<div class="row">';

                    $.each(item.Events, function (key, event) {
                        if (key < 4) {
                            html += '<div class="col-md-3">\
                                <div class="bokse">\
                                <div class="imgbokse"><img src="'+ event.Media[0].Url + '" class="img-responsive" alt="Responsive image" /></div>\
                                <h5><b><a href="detalje.html?id=' + event.Id + '">' + event.Name + '</a></b></h5>\
                                <p>' + event.Location.City + '</p>\
                                <hr />\
                                <p><a href="detalje.html?id=' + event.Id + '">' + item.Name + '</a></p>\
                                </div>\
                            </div>';
                        }
                    });
                    html += '</div><br/>';

                    $('#Cat').append(html);
                }
            });

            var Emne = '<div class="row"><div classs="col-md-12"><div class="knapper">';
            
            var count = 0;

            $.each(data, function (key, item) {

                if (count == 0) {

                    Emne += '<ul>';
                }

                Emne += '<li><a href="Search.html?cat='+item.Id+'" class="btn btn-default btn-sm knap">'+ item.Name + '</a></li>';
                   
                if (count == 5 || key == data.length - 1) {
                    Emne += '</ul>';
                    count = 0;
                } else {
                    count++;
                }
                        
            });
            Emne += '</div></div></div>';
            $('#KategoriEmner').append(Emne);
        });
    };
    GetCategories();


    function search() {
        $('#searchInput').val(getUrlVars().name);

        var name = "";
        if (getUrlVars().name != null)
            name = getUrlVars().name;

        var cat = "";
        if (getUrlVars().cat != null)
            cat = getUrlVars().cat;


        $.ajax({
            url: "api/Events/Search/?Name=" + name + "&cat=" + cat
        }).done(function (data) {
            console.log(data);

            var html = "";

            var count = 0;

            $.each(data, function (key, event) {
                 if(count == 0){
                     html += '<div class="row">';
                 }

                html += '<div class="col-md-3">\
                            <div class="bokseSearch">\
                                <div class="imgbokse"><img src="'+ event.Media[0].Url + '" class="img-responsive" alt="Responsive image" /></div>\
                                <h5><b><a href="detalje.html?id=' + event.Id + '">' + event.Name + '</a></b></h5>\
                                <p>' + event.Location.City + '</p>\
                                <hr />\
                                <p><a href="detalje.html?id=' + event.Id + '">' + event.Categories.Name + '</a></p>\
                            </div>\
                        </div>';

                if (count == 3 || key == data.length-1) {
                    html += '</div>';
                    count = 0;
                } else {
                    count++;
                }
            });

                $('#searchTekst').append(html);

        });

    }

    search();
});

