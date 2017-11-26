var m = new mandrill.Mandrill('Nfeh-_R1FDCIdSHbDb2srw'); // This will be public

function sendTheMail(){
    m.messages.send({
        "message": {
            "from_email": $("#email").val(),
            "from_name": $("#name").val(),
            "to":[{"email":  "saeed.tahir@fliclicks.com", "name": $("#name").val()}], // Array of recipients
            "subject": $("#company").val()+" Want to Contact",
            "text": $("#message").val() // Alternatively, use the "html" key to send HTML emails rather than plaintext
        }
    });
}