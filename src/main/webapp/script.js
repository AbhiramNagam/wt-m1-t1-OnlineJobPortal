document.addEventListener("DOMContentLoaded", () => {
    const addSkillButton = document.getElementById("addSkillButton");
    const skillsContainer = document.getElementById("skillsContainer");
    let skillCount = 0; // Initial skill count

    addSkillButton.addEventListener("click", () => {
        skillCount++;

        const skillInput = document.createElement("div");
        skillInput.classList.add("form_control");
        skillInput.innerHTML = `
                <input required="" class="input" type="text" name="skill${skillCount}">
                <label class="label">skill ${skillCount}</label>
            `;

        skillsContainer.appendChild(skillInput);
        document.getElementById("skillCount").value=skillCount;
        // document.querySelector('input[name="skillCount"]').value = skillCount;
    });

    const aspirationsButton = document.getElementById("aspirationsButton");
    const aspirationsContainer = document.getElementById("aspirationsContainer");
    let aspirationCount = 0;

    aspirationsButton.addEventListener("click", () => {
        aspirationCount++;
        const aspirationInput = document.createElement("div");
        aspirationInput.classList.add("form_control");
        aspirationInput.innerHTML = `
                <input required="" class="input" type="text" name="aspiration${aspirationCount}">
                <label class="label">Aspiration ${aspirationCount}</label>
            `;

        aspirationsContainer.appendChild(aspirationInput);
        document.getElementById("aspirationCount").value=aspirationCount;
        // document.querySelector('input[name="aspirationCount"]').value = aspirationCount;
    });
});