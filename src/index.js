async function getUsername() {
    const response = await fetch('/.auth/me');
    const json = await response.json();
    if(json.clientPrincipal && json.clientPrincipal.userDetails) {
        return json.clientPrincipal.userDetails;
    } else {
        return null;
    }
}

async function displayMessage() {
    const messageElement = document.getElementById('message');
    const username = await getUsername();
    if (username) {
        // user is authenticated
        // create message
        const usernameDisplay = document.createElement('div');
        usernameDisplay.innerText = `Welcome, ${username}! `;

        // create logout link
        const logoutLink = document.createElement('a');
        logoutLink.setAttribute('href', '/logout');
        logoutLink.innerText = 'Logout';

        // add to page
        messageElement.appendChild(usernameDisplay);
        messageElement.appendChild(logoutLink);
    } else {
        // user is anonymous
        // create login link
        const logoutLink = document.createElement('a');
        logoutLink.setAttribute('href', '/login');
        logoutLink.innerText = 'Login to the site!';

        // add to page
        messageElement.appendChild(logoutLink);
    }
}

window.onload = displayMessage