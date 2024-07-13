{{flutter_js}}
{{flutter_build_config}}

const loadingContainer = document.createElement('div');
loadingContainer.innerHTML = `
  <div class="bodyload">
    <div id="splash">
      <div class="loader"></div>
    </div>
    <div id="splashtext" style="color: #3BAF29;">
      <h3 id="loadText">mengunduh konten</h3>
    </div>
  </div>
`;

document.body.appendChild(loadingContainer);
let loadText = document.getElementById("loadText");
// loadText.textContent = "mengunduh konten";

// loading.textContent = "mengunduh konten";
// loading.setAttribute("align", "center");
_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    // loadText.textContent = "menyiapkan";
    const appRunner = await engineInitializer.initializeEngine();

    // loadText.textContent = "menjalankan aplikasi web";
    await appRunner.runApp();
  }
});