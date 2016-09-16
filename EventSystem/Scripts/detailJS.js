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


    function GetEvents() {

        console.log(getUrlVars());
        $.ajax({

            url: "api/events/" + getUrlVars().id

        }).done(function (data) {

            console.log(data);

            var detail = '<div class="row">\
                                    <div class="col-md-12"><div class="billede"><img src="' + data.Media[0].Url + '"class="img-responsive" alt="Responsive image" /></div> <div class="overskrift"><h1>' + data.Name + '</h1></div></div>\
                                    <a class="btn btn-default Linkforside" href="#" role="button">Find Billetter</a>\
                               </div>';

            var tid = '<div class=" row">\
                            <div class="col-md-6"><div class="Sted">\
                             <p class="icon"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>' + " " + data.EventStart + '</p>\
                             <p class="icon"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>' + " " + data.Location.Adress + ', ' + data.Location.Zipcode + ' ' + data.Location.City + '</p>\
                                <hr />\
                                 </div>\
                                 </div>\
                            <div class="col-md-6"></div>\
                          </div>';



            var tekst = '<div class="row">\
                                <div class="col-md-6"><div class="beskrivelse">' + data.Description + '</div></div>\
                                <div class="col-md-6"><div class="kort"><p>Billetter</p><p>DKK' + " " + data.NoOfTickets + ',00 + DKK ' + " " + data.Price + ',00 gebyr</p>\
                            <hr />\
                                <p>Din kortudbyder vil opkræve et ekstra gebyr udfra din korttype</p>\
                                </div>\
                                </div>\
                            </div>';




            $('#Vis').append(detail);
            $('#tekst').append(tekst);
            $('#tid').append(tid);



        });

    }


    GetEvents();


});