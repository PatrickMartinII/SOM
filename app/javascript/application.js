// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
$(document).ready(function(){
	roleSelector();
});

function roleSelector(){
	$('#user-role-select').change(function(){
		if(this.value == 'teacher'){
			$('#teacher-code-input').show();
		}
		else{
			$('#teacher-code-input').hide();
		}
	});
}