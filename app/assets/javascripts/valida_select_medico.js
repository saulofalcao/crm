
 // add the rule here
 $.validator.addMethod("valueNotEquals", function(value, element, arg){
  return arg != value;
 }, "Value must not equal arg.");

 // configure your validation
 $("form_seleciona_medico").validate({
  rules: {
   select_medico: { valueNotEquals: "--- Selecione um médico ---" }
  },
  messages: {
   select_medico: { valueNotEquals: "Por favor, selecione um médico" }
  }  
 });
