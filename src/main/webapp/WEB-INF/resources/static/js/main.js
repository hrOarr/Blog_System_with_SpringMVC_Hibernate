
// ajax form submit
$(document).ready(function() {
   $('#idForm').submit(function(e){
	e.preventDefault();
    const form = $(this);
    const url = form.attr('action');
    const method = form.attr('method');

    console.log(form.serialize());
    
    $.ajax({
           type: method,
           url: url,
           data: form.serialize(), // serializes the form's elements.
           success: function(data,status,xhr)
           {
               console.log(data); // show response
               console.log(status);
               console.log(xhr);
           }
         });
    })
});