const detectTheme = () => {
    const lightMode = localStorage.getItem('lightMode');

    if (lightMode) {
        document.documentElement.classList.remove('dark');
        document.documentElement.classList.add('light');
    }
};
detectTheme();

const changeTheme = () => {
    const themeButton = document.getElementById('theme');

    if (themeButton) {
        themeButton.addEventListener('change', (ev) => {
            if (themeButton.checked) {
                document.documentElement.classList.add('dark');
                document.documentElement.classList.remove('light');

                localStorage.removeItem('lightMode');
            } else {
                document.documentElement.classList.remove('dark');
                document.documentElement.classList.add('light');

                localStorage.setItem('lightMode', '1');
            }
        });
    }
};
changeTheme();

const contactOnSubmit = () => {
    const formContact = document.getElementById('contate-nos');

    if (formContact) {
        formContact.addEventListener('submit', (ev) => {
            ev.preventDefault();
            formContact.reset();

            document.body.classList.add('submitShow');

            setTimeout(() => {
                document.body.classList.remove('submitShow');
            }, 1500);
        });
        console.log(formContact);
    }
};
contactOnSubmit();
