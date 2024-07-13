{{flutter_js}}
{{flutter_build_config}}

const loading = document.createElement('div');
const text = document.createElement('p');
document.body.appendChild(loading);
loading.appendChild(text);

text.textContent = "mengunduh konten";
_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    text.textContent = "menyiapkan";
    const appRunner = await engineInitializer.initializeEngine();

    text.textContent = "menjalankan aplikasi web";
    await appRunner.runApp();
  }
});