$( document ).ready( function () {
   // console.log( $.type );
   // console.log( $( document ) );
   headerLinkListener( ".login_link" );
   headerLinkListener( ".register_link" );
   userLinkListener("#user_index");
   headerFormSubmitListener( "#register_new_user_form" );
   headerFormSubmitListener( "#login_user_form" );
   headerFormSubmitListener( "#logout_user_form" );
   doSomeCrazyStuff();
});

var generateRandomColor = function () {
   var num = Math.floor((Math.random() * 4) + 0);

   switch ( num ) {
      case 0:
         return "green"
         break;
      case 1:
         return "red"
         break;
      case 2:
         return "pink"
         break;
      case 3:
         return "orange"
         break;
      case 4:
         return "blue"
         break;
      default:
         return "blue"
   }
}

var doSomeCrazyStuff = function() {
   $( "div" ).on( "mouseover", "h1", function( event ) {

      event.preventDefault();
      var targetElement = $( this );
      targetElement.css('color', generateRandomColor());
   });
};

var setupHeaderForm = function( response ) {
   var targetParentListener = $ ( "#header_login_register_div" );
   targetParentListener.empty();
   targetParentListener.append(response);
};

var userLinkListener = function( link_id_name ) {
   $( link_id_name ).on( "click", function( event ) {
      event.preventDefault();

      var link = $(this);

      var request = $.ajax({
         method:  "GET",
         url:     link.attr( 'href' )
      });
      
      request.done( function( response ) {
         console.log("Header Link Response: ");
         console.log(response);
         // console.log($.parseJSON(response));
      });

      request.fail( function( response ){
         // console.log("FAIL Header Link Response:");
         // console.log(response);
         alert("Failed to access " + link.attr( 'href' ));
      });
   });
};

var headerLinkListener = function(link_class_name) {
   $( "#header_container" ).on( "click", link_class_name, function( event ) {
      event.preventDefault();

      var link = $(this);

      $.ajax({
         method:  "GET",
         url:     link.attr( 'href' )
      })
      .done( function( response ) {
         console.log("Header Link Response: ")
         console.log(response);
         setupHeaderForm( response );
      })
      .fail( function( response ){
         console.log("FAIL Header Link Response:")
         console.log(response);
         alert("Failed to access " + link.attr( 'href' ));
      });
   });
};

var headerFormSubmitListener = function( form_id_name ) {
   $( "#header_container" ).on( "submit", form_id_name, function( event ) {

      event.preventDefault();

      var form_id_name = $( this );

      $.ajax({
         method:  form_id_name.attr( 'method' ),
         url:     form_id_name.attr( 'action' ),
         data:    form_id_name.serialize()
      })
      .done( function( response ) {
         console.log("Header Form Response: ");
         console.log(response);
         setupHeaderForm( response );
      })
      .fail( function( response ){
         console.log("FAIL Header Form Response:");
         console.log(response);
         alert( "Failed to " + form_id_name.attr( 'method' ) 
                + " to " + form_id_name.attr( 'action' ));
      });
   });
};
