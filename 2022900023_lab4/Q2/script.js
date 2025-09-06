
const taskInput = document.getElementById('task-input');
const taskEtaInput = document.getElementById('task-eta-input');
const addTaskButton = document.getElementById('add-task-btn');
const taskList = document.getElementById('task-list');

// Set the minimum date for the ETA input to today
function setMinDate() {
    const today = new Date();
    // Format the date to YYYY-MM-DD for the min attribute
    const yyyy = today.getFullYear();
    const mm = String(today.getMonth() + 1).padStart(2, '0'); // Months are 0-indexed
    const dd = String(today.getDate()).padStart(2, '0');
    const todayFormatted = `${yyyy}-${mm}-${dd}`;
    
    taskEtaInput.setAttribute('min', todayFormatted);
}

// Call the function to set the minimum date when the script loads
setMinDate();


// Function to add a new task
function addTask() {
    const taskText = taskInput.value.trim();
    const etaText = taskEtaInput.value.trim();

    if (taskText !== "" && etaText !== "") {
        // Create list item
        const listItem = document.createElement('li');
        listItem.className = 'status-open'; // Default status

        // Create container for task text and metadata
        const taskDetails = document.createElement('div');
        taskDetails.className = 'task-details';

        // Create element for task text
        const taskTextElement = document.createElement('span');
        taskTextElement.className = 'task-text';
        taskTextElement.textContent = taskText;

        // Create element for metadata (ETA and Assignee)
        const taskMetaElement = document.createElement('span');
        taskMetaElement.className = 'task-meta';
        taskMetaElement.textContent = `ETA: ${etaText} | Assigned to: Me`;

        taskDetails.appendChild(taskTextElement);
        taskDetails.appendChild(taskMetaElement);

    
        const statusSelector = document.createElement('select');
        statusSelector.className = 'status-selector';
        const statuses = ['Open', 'In Progress', 'Completed'];
        
        statuses.forEach(status => {
            const option = document.createElement('option');
            option.value = status.toLowerCase().replace(' ', '');
            option.textContent = status;
            statusSelector.appendChild(option);
        });

        // Add event listener to the dropdown
        statusSelector.addEventListener('change', (e) => {
            listItem.className = ''; 
            listItem.classList.add(`status-${e.target.value}`);
        });

        // Append elements to the list item
        listItem.appendChild(taskDetails);
        listItem.appendChild(statusSelector);

        // Add the new list item to the task list
        taskList.appendChild(listItem);

        // Clear the input fields
        taskInput.value = "";
        taskEtaInput.value = "";
    } else {
        alert("Please fill in the task and select an ETA date.");
    }
}

// Add click event listener to the "Add Task" button
addTaskButton.addEventListener('click', addTask);

// Function to add task on 'Enter' key press
const addTaskOnEnter = (event) => {
    if (event.key === 'Enter') {
        addTask();
    }
};

// Add event listeners to both input fields
taskInput.addEventListener('keypress', addTaskOnEnter);
taskEtaInput.addEventListener('keypress', addTaskOnEnter);

