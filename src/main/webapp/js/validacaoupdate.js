//(confsenha == null || confsenha == "") ||(senhanew == null || senhanew == "")
document.getElementById('buttonatualizaruser').onclick = function validar2(){
	 var senhanew = document.getElementById('senhanew').value;
	 var confsenha = document.getElementById('senhanewconf').value;
	 var nome = document.getElementById('nome').value;
	 var senha = document.getElementById('senha').value;
	 var email = document.getElementById('email').value;
	 if((nome == null || nome == "") || (senha == null || senha == "") || (email == null || email == "")){
		 alert("TODOS OS CAMPOS PRECISAM SER PREENCHIDOS!");
		 return false;
	 }else if (nome.length < 6 || nome.length > 60) {
		 alert("CAMPO DEVE POSSUIR ENTRE ENTRE 6 E 60 CARACTERES");
		 return false;
	 }else if (senhanew != "" ) {
		 alert("PREENCHA AMBOS OS CAMPOS DA SENHA CASO DEJESE ALTERAR");
		 return false;
	 }else if (senhanew != confsenha) {
		 alert("SENHAS DIFERENTES!\nFAVOR DIGITAR SENHAS IGUAIS");
		 return false;
	 }else{
		 document.getElementById('updateusermodal').fadeIn;
		 return true;
	 }
}