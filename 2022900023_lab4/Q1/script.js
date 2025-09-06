const personalizeButton = document.getElementById('personalize-btn');
const card = document.getElementById('card');
const greetingText = document.getElementById('greeting-text');
const cardMessage = document.getElementById('card-message');

// Add a click event listener to the button
personalizeButton.addEventListener('click', function() {
    // Prompt the user for their name
    const userName = prompt("Please enter your name:");

    // Check if the user entered a name
    if (userName) {
        // Update the greeting text
        greetingText.textContent = `Hello, ${userName}!`;

        // Update the card message
        cardMessage.textContent = "Wishing you a fantastic day filled with joy and success. Hope you enjoy this personalized card!";

        // Change the card's background color
        card.style.backgroundColor = '#e0f7fa';

        // Change the greeting text color
        greetingText.style.color = '#00796b'; 
    }
});
