const toggleButton = (button) => {
    button.textContent = button.textContent === 'Learn More' ? 'Close' : 'Learn More';
};

const expandCard = (button) => {
    const card = button.parentNode;
    const expandedContent = card.querySelector('.expanded-content');
    expandedContent.style.display = expandedContent.style.display === 'block' ? 'none' : 'block';
    toggleButton(button);
};

const redirectToStudio = () => {
    window.location.href = 'studio.html';
};