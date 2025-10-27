<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Smart Kisan Assistant</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <script src="https://unpkg.com/lucide@latest"></script>
  <style>
    body { font-family: 'Inter', sans-serif; }
    .card {
      background-color: white;
      border-radius: 0.75rem;
      box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
      transition: all 0.2s ease-in-out;
    }
    .card:hover { transform: translateY(-4px); box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1); }
    .btn { display:inline-flex; align-items:center; justify-content:center; padding:0.75rem 1.5rem; border-radius:0.5rem; font-weight:500; cursor:pointer; transition:background-color 0.2s; }
    .btn-primary { background-color:#22c55e; color:white; }
    .btn-primary:hover { background-color:#16a34a; }
    .btn-secondary { background-color:#fb923c; color:white; }
    .btn-secondary:hover { background-color:#f97316; }
    .loader { border: 4px solid #f3f3f3; border-top:4px solid #22c55e; border-radius:50%; width:40px; height:40px; animation:spin 1s linear infinite; }
    @keyframes spin { 0%{transform:rotate(0)} 100%{transform:rotate(360deg)} }
    #notification { position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%); padding:1rem 2rem; border-radius:0.5rem; color:white; z-index:100; opacity:0; pointer-events:none; transition:opacity .25s, transform .25s; }
    #notification.show { opacity:1; transform: translateX(-50%) translateY(0); pointer-events:auto; }
    .bg-red-500 { background-color:#ef4444; }
    pre.ai-output { white-space: pre-wrap; word-wrap: break-word; font-family: inherit; }
  </style>
</head>
<body class="bg-gray-50 text-gray-800">

  <!-- Header -->
  <header class="bg-white shadow-md">
    <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center">
      <div class="flex items-center space-x-2">
        <i data-lucide="sprout" class="w-8 h-8 text-green-600"></i>
        <h1 class="text-2xl font-bold text-gray-800">Smart Kisan Assistant</h1>
      </div>
      <p class="text-sm text-gray-500">Your AI Farming Partner</p>
    </div>
  </header>

  <!-- Main -->
  <main class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

      <!-- Left Column -->
      <div class="lg:col-span-1 space-y-8">
        <!-- Farm details -->
        <div class="card p-6">
          <div class="flex items-center space-x-3 mb-4">
            <i data-lucide="clipboard-list" class="w-6 h-6 text-green-600"></i>
            <h2 class="text-xl font-semibold">Farm Details</h2>
          </div>

          <form id="farm-details-form" class="space-y-4">
            <div>
              <label for="location" class="block text-sm font-medium text-gray-700">Location (for weather)</label>
              <input type="text" id="location" name="location" placeholder="e.g., Pune, Maharashtra" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none sm:text-sm">
            </div>
            <div>
              <label for="soil-type" class="block text-sm font-medium text-gray-700">Soil Type</label>
              <select id="soil-type" name="soil-type" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none sm:text-sm">
                <option>Alluvial Soil</option>
                <option>Black Soil</option>
                <option>Red Soil</option>
                <option>Laterite Soil</option>
                <option>Desert Soil</option>
              </select>
            </div>
            <div>
              <label for="crop" class="block text-sm font-medium text-gray-700">Current Crop (Optional)</label>
              <input type="text" id="crop" name="crop" placeholder="e.g., Sugarcane" class="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none sm:text-sm">
            </div>
            <button type="submit" class="btn btn-primary w-full">✨ Get AI Recommendations</button>
          </form>
        </div>

        <!-- Plant disease -->
        <div class="card p-6">
          <div class="flex items-center space-x-3 mb-4">
            <i data-lucide="scan-line" class="w-6 h-6 text-red-500"></i>
            <h2 class="text-xl font-semibold">Plant Disease Detection</h2>
          </div>

          <div class="text-sm text-gray-600 mb-4">Upload a plant leaf photo for quick diagnosis.</div>

          <div id="image-upload-area" class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-md">
            <div class="space-y-1 text-center">
              <i data-lucide="image" class="mx-auto h-12 w-12 text-gray-400"></i>
              <div class="flex text-sm text-gray-600">
                <label for="file-upload" class="relative cursor-pointer bg-white rounded-md font-medium text-green-600">
                  <span>Upload a file</span>
                  <input id="file-upload" name="file-upload" type="file" class="sr-only" accept="image/*">
                </label>
                <p class="pl-1">or drag and drop</p>
              </div>
              <p class="text-xs text-gray-500">PNG, JPG, up to 10MB</p>
            </div>
          </div>

          <div id="image-preview-container" class="hidden mt-4">
            <img id="image-preview" src="#" alt="Image Preview" class="max-h-40 mx-auto rounded-md"/>
            <button id="analyze-btn" class="btn btn-primary w-full mt-4">
              <i data-lucide="bar-chart-2" class="w-4 h-4 mr-2"></i> ✨ Analyze Plant with AI
            </button>
          </div>

          <div id="disease-result-container" class="hidden mt-4 text-center">
            <div id="disease-loader" class="mx-auto loader"></div>
            <div id="disease-result-text" class="mt-4"></div>
            <button id="treatment-btn" class="btn btn-secondary w-full mt-4 hidden">
              <i data-lucide="syringe" class="w-4 h-4 mr-2"></i> ✨ Get AI Treatment Plan
            </button>
            <div id="treatment-loader" class="mx-auto loader hidden mt-4"></div>
            <div id="treatment-result-text" class="mt-4 text-left p-3 bg-orange-50 rounded-md"></div>
          </div>
        </div>
      </div>

      <!-- Right Column -->
      <div id="recommendations-section" class="lg:col-span-2 card p-6 hidden">
        <div class="flex items-center space-x-3 mb-6">
          <i data-lucide="lightbulb" class="w-8 h-8 text-green-600"></i>
          <div>
            <h2 class="text-2xl font-semibold">AI Farming Recommendations</h2>
            <p class="text-gray-500">Based on your inputs for <strong id="location-display"></strong>.</p>
          </div>
        </div>

        <div id="recommendations-loader" class="flex justify-center items-center h-64">
          <div class="loader"></div>
        </div>

        <div id="recommendations-content" class="hidden space-y-6">
          <div class="bg-green-50 p-4 rounded-lg">
            <h3 class="font-bold text-lg flex items-center"><i data-lucide="rotate-cw" class="w-5 h-5 mr-2 text-green-700"></i> Crop Rotation</h3>
            <pre id="crop-rotation" class="mt-2 text-gray-700 ai-output"></pre>
          </div>
          <div class="bg-yellow-50 p-4 rounded-lg">
            <h3 class="font-bold text-lg flex items-center"><i data-lucide="flask-conical" class="w-5 h-5 mr-2 text-yellow-700"></i> Fertilizer Usage</h3>
            <pre id="fertilizer-usage" class="mt-2 text-gray-700 ai-output"></pre>
          </div>
          <div class="bg-blue-50 p-4 rounded-lg">
            <h3 class="font-bold text-lg flex items-center"><i data-lucide="cloud-drizzle" class="w-5 h-5 mr-2 text-blue-700"></i> Water Requirements</h3>
            <pre id="water-requirements" class="mt-2 text-gray-700 ai-output"></pre>
          </div>
        </div>
      </div>

      <!-- Placeholder -->
      <div id="recommendations-placeholder" class="lg:col-span-2 card flex flex-col justify-center items-center text-center p-10 bg-gray-100 border-2 border-dashed border-gray-300">
        <i data-lucide="microscope" class="w-16 h-16 text-gray-400 mb-4"></i>
        <h3 class="text-xl font-medium text-gray-700">Your AI recommendations will appear here.</h3>
        <p class="text-gray-500 mt-2">Fill in your farm details to begin.</p>
      </div>

    </div>
  </main>

  <div id="notification"></div>

  <script>
    lucide.createIcons();

    // ---- DOM ----
    const farmDetailsForm = document.getElementById('farm-details-form');
    const recommendationsSection = document.getElementById('recommendations-section');
    const recommendationsPlaceholder = document.getElementById('recommendations-placeholder');
    const recommendationsLoader = document.getElementById('recommendations-loader');
    const recommendationsContent = document.getElementById('recommendations-content');
    const locationDisplay = document.getElementById('location-display');
    const fileUpload = document.getElementById('file-upload');
    const imagePreviewContainer = document.getElementById('image-preview-container');
    const imagePreview = document.getElementById('image-preview');
    const analyzeBtn = document.getElementById('analyze-btn');
    const diseaseResultContainer = document.getElementById('disease-result-container');
    const diseaseLoader = document.getElementById('disease-loader');
    const diseaseResultText = document.getElementById('disease-result-text');
    const treatmentBtn = document.getElementById('treatment-btn');
    const treatmentLoader = document.getElementById('treatment-loader');
    const treatmentResultText = document.getElementById('treatment-result-text');
    const notification = document.getElementById('notification');

    // ======= GEMINI CONFIG - PASTE YOUR KEY HERE FOR LOCAL TESTING ONLY =======
    const apiKey = "AIzaSyDBVGH5SNmK0lqGuMEymRI7LrDDgrbiIDA"; // <-- replace for quick tests (NOT secure)
    const apiUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${apiKey}`;

    // last detected disease name
    let lastDetectedDisease = '';

    // ---- UI Helpers ----
    function showNotification(message, isError=true) {
      notification.textContent = message;
      notification.className = isError ? 'bg-red-500 show' : 'bg-green-600 show';
      setTimeout(() => { notification.classList.remove('show'); }, 3500);
    }

    // Convert file to base64 string (data part only)
    function fileToBase64(file) {
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result.split(',')[1]);
        reader.onerror = (err) => reject(err);
      });
    }

    // Central Gemini call (text-only or with inline data)
    async function callGemini(payload) {
      try {
        const res = await fetch(apiUrl, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        });
        if (!res.ok) {
          const txt = await res.text();
          throw new Error(`${res.status} ${res.statusText} - ${txt}`);
        }
        const json = await res.json();
        // best-effort parse
        const text = json?.candidates?.[0]?.content?.parts?.[0]?.text;
        return text ?? JSON.stringify(json, null, 2);
      } catch (err) {
        console.error("Gemini call error:", err);
        throw err;
      }
    }

    // ---- Event: farm details submit ----
    farmDetailsForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const location = document.getElementById('location').value.trim();
      const soilType = document.getElementById('soil-type').value;
      const crop = document.getElementById('crop').value || 'not specified';

      if (!location) { showNotification('Please enter a location.'); return; }

      // show UI
      recommendationsPlaceholder.classList.add('hidden');
      recommendationsSection.classList.remove('hidden');
      recommendationsLoader.style.display = 'flex';
      recommendationsContent.classList.add('hidden');
      locationDisplay.textContent = location;

      // build prompts
      const systemPrompt = "You are an expert agricultural assistant for Indian farmers. Provide clear, concise, and practical advice. Use titles 'Crop Rotation:', 'Fertilizer Usage:', 'Water Requirements:' before each section.";
      const userQuery = `I am a farmer in ${location}, India. My soil type is ${soilType} and my current crop is ${crop}. Provide recommendations for the following, each in a separate paragraph with a title:
1.  **Crop Rotation:** Suggest one or two suitable crops for rotation.
2.  **Fertilizer Usage:** Recommend a suitable NPK ratio and application amount.
3.  **Water Requirements:** Give advice on irrigation frequency based on general conditions for this location.
Keep answers short and actionable.`;

      const payload = {
        systemInstruction: { parts: [{ text: systemPrompt }] },
        contents: [{ parts: [{ text: userQuery }] }]
      };

      try {
        const text = await callGemini(payload);
        // parse by titles (robust fallback to raw text)
        const cropRotationMatch = text.match(/Crop Rotation:\s*([\s\S]*?)(?=Fertilizer Usage:|Water Requirements:|$)/i);
        const fertilizerMatch = text.match(/Fertilizer Usage:\s*([\s\S]*?)(?=Water Requirements:|Crop Rotation:|$)/i);
        const waterMatch = text.match(/Water Requirements:\s*([\s\S]*?)(?=Crop Rotation:|Fertilizer Usage:|$)/i);

        document.getElementById('crop-rotation').textContent = cropRotationMatch ? cropRotationMatch[1].trim() : text;
        document.getElementById('fertilizer-usage').textContent = fertilizerMatch ? fertilizerMatch[1].trim() : 'No fertilizer advice found.';
        document.getElementById('water-requirements').textContent = waterMatch ? waterMatch[1].trim() : 'No water advice found.';

      } catch (err) {
        showNotification('Failed to fetch recommendations. See console for details.');
        document.getElementById('crop-rotation').textContent = '';
        document.getElementById('fertilizer-usage').textContent = '';
        document.getElementById('water-requirements').textContent = '';
      } finally {
        recommendationsLoader.style.display = 'none';
        recommendationsContent.classList.remove('hidden');
      }
    });

    // ---- file upload preview ----
    fileUpload.addEventListener('change', () => {
      const file = fileUpload.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          imagePreview.src = e.target.result;
          imagePreviewContainer.classList.remove('hidden');
          diseaseResultContainer.classList.add('hidden');
          treatmentBtn.classList.add('hidden');
          treatmentResultText.classList.add('hidden');
        };
        reader.readAsDataURL(file);
      }
    });

    // ---- analyze image ----
    analyzeBtn.addEventListener('click', async () => {
      const file = fileUpload.files[0];
      if (!file) { showNotification("Please upload an image first."); return; }

      imagePreviewContainer.classList.add('hidden');
      diseaseResultContainer.classList.remove('hidden');
      diseaseLoader.style.display = 'block';
      diseaseResultText.classList.add('hidden');
      treatmentBtn.classList.add('hidden');
      treatmentResultText.classList.add('hidden');

      try {
        const base64Data = await fileToBase64(file);
        // short prompt asking for one-word disease name or 'Healthy'
        const imgPromptText = "Analyze this image of a plant leaf. Identify if it is healthy or has a specific disease. Reply ONLY with the disease name (e.g., 'Early Blight', 'Powdery Mildew') or 'Healthy'.";

        const payload = {
          contents: [{
            parts: [
              { text: imgPromptText },
              { inlineData: { mimeType: file.type, data: base64Data } }
            ]
          }]
        };

        const text = await callGemini(payload);
        const diseaseName = String(text || '').trim();

        if (!diseaseName) {
          throw new Error("No disease identified in response.");
        }

        lastDetectedDisease = diseaseName;

        if (diseaseName.toLowerCase() === 'healthy') {
          diseaseResultText.innerHTML = `<p class="font-semibold text-green-600">Result: Healthy</p><p class="text-sm text-gray-500">No disease detected.</p>`;
          treatmentBtn.classList.add('hidden');
        } else {
          diseaseResultText.innerHTML = `<p class="font-semibold text-red-600">Result: ${diseaseName}</p>`;
          treatmentBtn.classList.remove('hidden');
        }

      } catch (err) {
        console.error("Analyze error:", err);
        diseaseResultText.innerHTML = `<p class="font-semibold text-gray-600">Analysis Failed</p><p class="text-sm text-gray-500">See console for details.</p>`;
        showNotification('Failed to analyze plant image.');
      } finally {
        diseaseLoader.style.display = 'none';
        diseaseResultText.classList.remove('hidden');
      }
    });

    // ---- treatment plan for detected disease ----
    treatmentBtn.addEventListener('click', async () => {
      if (!lastDetectedDisease) return;

      treatmentBtn.classList.add('hidden');
      treatmentLoader.classList.remove('hidden');
      treatmentResultText.classList.add('hidden');

      const userQuery = `Provide a simple, step-by-step treatment plan for a farmer to deal with "${lastDetectedDisease}" on their crops. Include both organic and chemical options if possible, and keep instructions short and actionable.`;

      const payload = { contents: [{ parts: [{ text: userQuery }] }] };

      try {
        const text = await callGemini(payload);
        treatmentResultText.textContent = text;
      } catch (err) {
        console.error("Treatment error:", err);
        showNotification("Could not fetch treatment plan.");
        treatmentResultText.textContent = "Error loading plan.";
      } finally {
        treatmentLoader.classList.add('hidden');
        treatmentResultText.classList.remove('hidden');
      }
    });

    // --- drag & drop support (optional) ---
    const uploadArea = document.getElementById('image-upload-area');
    ['dragenter','dragover'].forEach(evt => {
      uploadArea.addEventListener(evt, (e) => { e.preventDefault(); uploadArea.classList.add('ring-2','ring-green-300'); });
    });
    ['dragleave','drop'].forEach(evt => {
      uploadArea.addEventListener(evt, (e) => { e.preventDefault(); uploadArea.classList.remove('ring-2','ring-green-300'); });
    });
    uploadArea.addEventListener('drop', (e) => {
      const f = e.dataTransfer.files?.[0];
      if (f) {
        fileUpload.files = e.dataTransfer.files;
        const reader = new FileReader();
        reader.onload = (ev) => {
          imagePreview.src = ev.target.result;
          imagePreviewContainer.classList.remove('hidden');
          diseaseResultContainer.classList.add('hidden');
        };
        reader.readAsDataURL(f);
      }
    });

  </script>
</body>
</html>
  