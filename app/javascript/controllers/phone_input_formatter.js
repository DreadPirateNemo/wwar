document.addEventListener("DOMContentLoaded", function () {
    const phoneInput = document.getElementById("phone-input");

    if (phoneInput) {
        phoneInput.addEventListener("blur", function () {
            let phoneNumber = this.value.replace(/\D/g, ''); // Remove non-numeric characters

            if (phoneNumber.length === 10) {
                this.value = phoneNumber.replace(/(\d{3})(\d{3})(\d{4})/, '($1) $2 - $3');
            } else if (phoneNumber.length > 0) {
                alert('Please enter a valid 10-digit phone number.');
                this.value = '';
            }
        });
    }
});