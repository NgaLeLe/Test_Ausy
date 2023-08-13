*** Variables ***
${msg_user_invalid}     Wrong password.
${msg_input_blank}      Please fill out Username and Password.
${user_invalid}         abc
${pswd_invalid}         abc

&{var_cas1}             usr=${user_invalid}     pswd=
&{var_cas2}             usr=    pswd=${pswd_invalid}
&{var_cas3}             usr=    pswd=
@{list_casdt}           ${var_cas1}     ${var_cas2}     ${var_cas3}


