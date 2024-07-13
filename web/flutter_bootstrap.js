{{flutter_js}}
{{flutter_build_config}}

const loading = document.createElement('div');
loading.style.width = '100vw';
loading.style.height = '100vw';
loading.style.alignContent = "center";
loading.style.alignItems = "center";
const text = document.createElement('p');
document.body.appendChild(loading);
loading.appendChild(text);

loading.textContent = "mengunduh konten";
// loading.setAttribute("align", "center");
_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    loading.textContent = "menyiapkan";
    const appRunner = await engineInitializer.initializeEngine();

    loading.textContent = "menjalankan aplikasi web";
    await appRunner.runApp();
  }
});