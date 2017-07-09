document.getElementById('buttoncadastraruser').onclick = function validar(){
	 var senha = document.getElementById('senha').value;
	 var confsenha = document.getElementById('confsenha').value;
	 var nome = document.getElementById('nome').value;
	 var matricula = document.getElementById('matricula').value;
	 var email = document.getElementById('email').value;
	 
	 if((nome == null || nome == "") || (senha == null || senha == "") || (confsenha == null || confsenha == "") ||
			 (matricula == null || matricula == "") || (email == null || email == "")){
		 alert("TODOS OS CAMPOS PRECISAM SER PREENCHIDOS!");
		 return false;
	 }else if (nome.length < 6 || nome.length > 60) {
		 alert("CAMPO NOME DEVE POSSUIR ENTRE ENTRE 6 E 60 CARACTERES");
		 return false;
	 }else if (senha.length < 8 || senha.length > 40) {
		 alert("CAMPO SENHA DEVE POSSUIR ENTRE ENTRE 8 E 40 CARACTERES");
		 return false;
	 }else if (email.length < 10 || email.length > 60) {
		 alert("CAMPO EMAIL DEVE POSSUIR ENTRE ENTRE 8 E 40 CARACTERES");
		 return false;
	 }else if (senha != confsenha) {
		 alert("SENHAS DIFERENTES!\nFAVOR DIGITAR SENHAS IGUAIS");
		 return false;
	 }else{
		 document.getElementById('formusercad').submit();
		 return true;
	 }
}
