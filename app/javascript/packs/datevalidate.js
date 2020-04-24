$(document).ready(function () {



    $("#submit_btn").on("click", function () {
        if (document.getElementById("check_in").value == null) {
            alert("booking is empty")
        }
        var b = document.getElementsByClassName("room_avail");
        for (i = 0; i < b.length; i++) {
            for (j = i + 1; j < b.length; j++) {
                if (b[i].value == b[j].value) {
                    alert("Please select different rooms")
                    return false
                }

            }
        }
    });

    $('#check_out').on("change", function () {
        if (document.getElementById("check_out").value == document.getElementById("check_in").value) {
            alert("date cannot be same");
            document.getElementById("check_out").value = "";
        }
        else {

            var check_in = new Date(document.getElementById("check_in").value);
            var check_out = new Date(document.getElementById("check_out").value);
        }

        $.ajax({

            type: "GET",
            url: "/avail_date",
            data: { check_in: $("#check_in").val(), check_out: $("#check_out").val(), hotel_id: $("#hotel_id").val() },

            success: function (data) {
                console.log(data);
                var r = document.getElementsByClassName("room_avail");
                $(".room_avail").empty();

                // const output = [];

                // data.rooms.forEach(room => {
                //     data.category.forEach(cat => {
                //         console.log("room>>", room.category_id, "category>>", cat.id)
                //         if (room.category_id === cat.id) {
                //             output.push({
                //                 room_number: room.room_number,
                //                 category: cat.name,
                //                 price: cat.price,
                //             })
                //         }
                //     });
                // });

                // const arrayUniqueByKey = [...new Map(output.map(item =>
                //     [item["room_number"], item])).values()];

                // console.log('output', arrayUniqueByKey);

                $.each(data['rooms'], function (key, value) {
                    // temp = (value['room_number'] + ' ' + '(' + value['category'] + ') ' + ' ' + '(' + value['price'] + ') ');
                    temp = (value['room_number']);
                    $('.room_avail').append($('<option>').val(temp).text(temp));
                });

            }

        })
    });

    $('#room_price').on("change", function () {
        
        $.ajax({ 
            type: "GET",
            url: "/show_room",
            data: { room_id: $("#room_price").val(), hotel_id: $("#hotel_id").val() },

            success: function (data) {
                $("#room_category").html(data["room_price"]["name"]);
                $("#room_category_price").html(data["room_price"]["price"]);
            }

        });

    
     
    })










});
