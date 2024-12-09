# Tindex - Flutter Blog App

Welcome to **Tindex**, a minimal yet robust blogging app built with **Flutter**, designed to fetch and display data seamlessly from the **Ghost CMS API**. This basic version of Tindex focuses on providing a smooth and delightful reading experience while showcasing posts, tags, and author information with a dynamic theme system that adapts to your device's light or dark mode settings.

---

## ✨ Why Choose Ghost CMS?

Ghost CMS is a powerful, modern, and open-source content management system built for professional publishing. With its clean architecture, excellent API support, and high performance, it perfectly complements Tindex's goal of delivering a fast and reliable blogging experience. Its flexibility allows us to scale and extend functionality easily as our app evolves.

---

## 🚀 Features in the Basic Version

### 1. **Fetch Posts, Tags, and Authors**

Tindex seamlessly integrates with Ghost CMS, fetching:

- Latest **posts** for your readers.
- Categorized **tags** to make content easy to explore.
- Detailed **author profiles** for transparency and engagement.

### 2. **Dynamic Theming**

The app automatically adapts to the device's theme settings:

- **Light Mode** for bright, clear daytime reading.
- **Dark Mode** for a smooth and eye-friendly nighttime experience.

### 3. **MTI License**

Tindex's basic version is licensed under the permissive **MIT License**, allowing developers to use, modify, and distribute the app freely.

---

## 🌟 Premium Version Features

The premium version of Tindex offers a range of advanced features that build upon the capabilities of the basic version. These enhancements are designed to improve both user experience and content management for authors:

### 1. **UI Customizations**
   - **More Themes**: Enjoy a wider selection of themes for greater personalization and style.

### 2. **Enhanced Security**
   - **Screen Pin Lock**: Add an extra layer of protection by locking the app to a specific screen.
   - **Fingerprint Authentication**: Access the app securely with fingerprint recognition for convenience and privacy.

### 3. **Shareable Content**
   - Easily share posts and content across social platforms, increasing engagement and reach.

### 4. **Powerful Search Functionality**
   - **Full-Text Search**: Find content quickly with a comprehensive search feature that includes posts, authors, and tags.

### 5. **Localization Support**
   - **Multi-Language Content**: Cater to a global audience with support for content in multiple languages.

### 6. **Advanced Content Discovery**
   - **Reading Time**: Get an estimate of how long it will take to read each post, helping users plan their reading time.
   - **Posts by Tag**: Effortlessly explore content by specific tags for seamless topic navigation.
   - **Posts by Author**: Quickly locate all posts by a particular author, making it easy to follow your favorite contributors.

### 7. **Enhanced Author and Content Presentation**
   - **Author Profiles**: Display detailed profiles for each author, including:
     - Profile and cover images
     - A full bio with direct links to social media for improved engagement
   - **Dynamic Accent Color**: The app’s accent color adapts automatically based on settings in Ghost CMS, providing a unique and branded visual experience.

### 8. **Additional Content Features**
   - **Fetch Pages**: Easily access essential static pages, such as About, Contact, and other important content.
   - **Header and Footer Navigation**: Streamline navigation with customizable header and footer items for a well-organized structure.
   - **Latest Posts**: Stay up-to-date with real-time updates of the latest content.

### 9. **Advanced Author and Topic Highlights**
   - **Top 3 Authors**: Showcase the top three authors based on user engagement and post contributions, offering recognition to popular contributors.
   - **Top 5 Topics**: Highlight the five most popular or most-read topics to keep your audience engaged and informed.

### 10. **Hero Posts Slider**
   - Feature key content with a dynamic and visually engaging slider that highlights “hero” posts in an interactive and attractive way.

### 11. **Drawer Navigation**
   - A sleek, user-friendly drawer navigation system provides quick, intuitive access to all sections of the app.

### 12. **Multi-Device Support**
Seamlessly sync your account across multiple devices, ensuring that your content and preferences are accessible anywhere, anytime.

---

🌟 Why Choose Tindex Premium?

By unlocking the premium version, you gain access to a full suite of features designed to elevate both the content presentation and user interaction within the app. Whether you're looking to showcase more content or engage your audience more deeply, the premium version offers everything needed for a top-tier blogging experience.

If you're interested in the premium version or would like to inquire about custom features, feel free to contact the developer or support the project by donating.

---

## 🛠️ Installation Steps

1. **Clone the Repository**  
   First, clone the repository to your local machine using the following command:
   ```bash
   git clone https://github.com/khawarizmix/tindex.git
   ```

2. **Install Dependencies**  
   Navigate to the project directory and install the required dependencies by running:
   ```bash
   cd tindex
   flutter pub get
   ```

3. **Configure API URL and Key**  
   To connect the app with your Ghost CMS, you'll need to configure the **base URL** and **API Key** in the `lib/services/api.dart` file.

---

## 🔧 How to Change Values in `api.dart`

The `api.dart` file contains the settings for your Ghost CMS API connection. Here's how to update it:

1. Open the `lib/services/api.dart` file in your code editor.

2. Locate the following lines:
   ```dart
   final GhostService ghostService = GhostService(
     baseUrl: 'https://demo.ghost.io',
     apiKey: '22444f78447824223cefc48062',
   );
   ```

3. **Change the `baseUrl`** to your Ghost CMS site’s URL. If you're using your own Ghost instance, replace `https://demo.ghost.io` with your domain.
   - Example: 
     ```dart
     baseUrl: 'https://your-ghost-blog.com',
     ```

4. **Change the `apiKey`**: You need to generate an API key from your Ghost admin panel to fetch data securely.

---

## 📝 How to Generate API Key in Ghost Admin Panel

1. **Log in to the Ghost Admin Panel**  
   Go to your Ghost admin panel at `https://your-ghost-blog.com/ghost/`.

2. **Navigate to Integrations**  
   In the left-hand sidebar, click on **"Settings"** and then select **"Integrations"**.

3. **Create a Custom Integration**  
   - Scroll down to the **"Custom Integrations"** section and click **"Add Custom Integration"**.
   - Give it a name, e.g., `Tindex Flutter App`.
   - Click **"Create"** to generate the integration.

4. **Get the API Key**  
   Once the integration is created, you’ll see an **Content API Key** associated with it. Copy this key.

5. **Paste the API Key**  
   Return to the `lib/services/api.dart` file and paste the generated API key into the `apiKey` field in your app:
   ```dart
   apiKey: 'your-generated-api-key-here',
   ```

---

Now your app will be properly configured to connect to your Ghost CMS and fetch content dynamically!

## 💡 Why Support Tindex?

Your contributions help us:

1. Expand features faster.
2. Maintain and improve app stability.
3. Introduce new technologies and performance optimizations.

By donating, you actively shape the future of Tindex, ensuring its sustainability and growth.

---

## 📞 Contact

For inquiries, feature requests, or support for a customized version of Tindex, reach out to us at:
. The email link ([khawarizmi@ik.me](mailto:khawarizmi@ik.me)).
. The support page link ([support page](https://www.mindex.dev/support)).

---

## 🌟 Get Involved

If you'd like to contribute to Tindex or suggest improvements, feel free to fork the repository, share feedback, or participate in the development process.

Thank you for using Tindex—your gateway to an elegant and connected blogging experience!
