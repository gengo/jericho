var AccessControls = function(){
      // get control elements
		  var email = $('input[type="email"]');
      var password = $('input[type="password"]');

		function init(){
		    /* close the gengo-create account section */
        setHiddenSections()
        setValidationControls()
		 }

    function setHiddenSections(){
      // only set this when there is no error.

      if(!$("div").hasClass("contains-error")){
        var gengoInputArea = $('#gengo-create')
        gengoInputArea.addClass("hidden");
        /* Add show hide action */
        $('.gengo-create-heading').removeClass("hidden").click(function(e){
            e.preventDefault();
            showHide(gengoInputArea)
            showHide($('.gengo-create-heading'))
        })

      }
    }
    function setValidationControls(){


       // set focus for email control elements
      email.bind("focus", function(){
        if ($(this).parent().hasClass("error")){

          $(this).parent().removeClass("error");
        }

      })

      // set focus for email control elements
      password.bind("focus", function(){
        if ($(this).parent().hasClass("error")){

          $(this).parent().removeClass("error");
           // if email is already as a val we can remove class from that field aswell.
          if(emailHasValue()){
            email.parent().removeClass("error");
          }
        }

      })

    }

    /* ----------------------- */
    /* HELPERS */
    /* ---------------------- */
    function emailHasValue(){
      var email = $('input[type="email"]');
      if(email.val()==""){
       return false;
      }else{
        return true;
      }
    }

    function showHide(obj){

        if(obj.hasClass("hidden")){
            obj.removeClass("hidden")
        }else{
            obj.addClass("hidden");
        }
    }

		return {
			setControls: init
		}
};
$(function(){

	window.accessControls = AccessControls();
	accessControls.setControls();

})

var pholder = new function()
{
    this.init = function()
    {
        if(! Modernizr.input.placeholder)
        {
            $("input").each(function() {
                if($(this).val() == "" && $(this).attr("placeholder") != "") {
                    if (! $(this).hasClass('real-password') && !$(this).hasClass('text-password'))
                    {
                        $(this).val($(this).attr("placeholder"));
                        $(this).focus(function() {
                            if($(this).val() == $(this).attr("placeholder"))
                                $(this).val("");
                        });
                        $(this).blur(function() {
                            if($(this).val() == "")
                            {
                                $(this).val($(this).attr("placeholder"));
                            }
                        });
                    }
                }
            });

            $('.text-password').show();
            $('.real-password').hide();
            $('.text-password').val($('.text-password').attr('placeholder'));

            $('.text-password').focus(this.focusTextPassword);
            $('.real-password').blur(this.blurRealPassword);
        }
    };

    this.focusTextPassword = function(e)
    {
        $(this).val('');
        $(this).hide();
        $('.real-password').show();
        $('.real-password').focus();
        $('.real-password').setSelectionRange(0, 0);
    };

    this.blurRealPassword = function(e)
    {
        if ($(this).val() == '')
        {
            $(this).hide();
            $('.text-password').val($('.text-password').attr('placeholder'));
            $('.text-password').show();
        }
    };
}
$(function() { pholder.init(); });
