// https://nb2ikd1ft4.execute-api.us-east-1.amazonaws.com/production
document.addEventListener('DOMContentLoaded', function() {
    console.log("sending request    ")
    $.ajax({
        type: 'GET',
        crossDomain: true,
        url: 'https://nb2ikd1ft4.execute-api.us-east-1.amazonaws.com/production',
        success: function(data){
            console.log(data)
        },
        error: function(err){
            console.log("fail")
            console.log(err)
        }
    })
}, false);