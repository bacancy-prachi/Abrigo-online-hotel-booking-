$(document).ready(function () {
    
    
    
    $("#submit_btn").on("click", function() {
        if(document.getElementById("check_in").value == null){
            alert("booking is empty")
        }
        var b = document.getElementsByClassName("room_avail");
        for (i = 0; i < b.length; i++) {
            for (j = i+1; j < b.length; j++) {
                if(b[i].value==b[j].value)
                {
                    alert("Please select different rooms")
                    return false    
                }
                
            }
          }    
      });





    $("#check_out").on("change",function () {
        
       

        if(document.getElementById("check_out").value == document.getElementById("check_in").value ){
            alert("date cannot be same");
            document.getElementById("check_out").value="";
        }
        else
        {
            var check_in=new Date(document.getElementById("check_in").value);
            var check_out=new Date(document.getElementById("check_out").value);
            // var Difference_In_Time = check_out.getTime() - check_in.getTime(); 
            // var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);

            // $.ajax({
            //     type: "Post",
            //     url: "/bookings",
            //     data: {Difference_In_Days},
            //     ContentType: "application/json; charset=utf-8",
            //     dataType: "json",
            // });
        }

    });
})



