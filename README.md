# Hazem Said Portfolio - Flutter Single Page App

A beautiful dark-themed single-page portfolio application built with Flutter, inspired by Hazem Said's portfolio design. Features smooth scroll navigation between sections with a modern dark theme and pink accents.

## 🎨 Design Features

- **Dark Theme**: Professional dark background with pink accent colors
- **Single Page Application**: All content displayed on one page with smooth scrolling
- **Scroll Navigation**: Click navigation items to smoothly scroll to different sections
- **Fully Responsive Design**: Optimized for mobile, tablet, and desktop with adaptive layouts
- **Modern UI**: Material Design 3 with beautiful gradients and animations
- **Professional Layout**: Clean, modern design similar to Hazem Said's portfolio
- **DM Sans Font**: Modern, clean typography for better readability
- **Animated Background**: Dynamic particle system with connecting lines
- **Profile Animations**: Animated profile image with floating tech icons
- **Skill Animations**: Rotating skill icons with elastic animations
- **Service Animations**: Animated service cards with scaling effects
- **Button Animations**: Interactive button animations with shadows
- **Mobile Menu**: Hamburger menu for mobile navigation
- **Adaptive Grids**: Responsive grid layouts that adjust to screen size

## 🚀 Features

- **Hero Section**: Eye-catching introduction with profile image and call-to-action buttons
- **About Section**: Personal information with highlighted skills and experience
- **Services Section**: Professional services offered in a grid layout
- **Resume Section**: Education and experience timeline
- **Skills Section**: Technical skills displayed in a colorful grid
- **Projects Section**: Portfolio projects with categories and descriptions
- **Contact Section**: Contact form with social media links and footer

## 🎯 Navigation System

The app uses a custom scroll navigation system instead of traditional routing. Here's how it works:

### Core Components

1. **ManagementRoute Class** (`lib/core/route/mangement_route.dart`)
   - Contains GlobalKey for each section
   - Provides scroll controller
   - Includes navigation methods for smooth scrolling

2. **Section Keys**
   - `homeKey` - Home/Hero section
   - `aboutKey` - About section  
   - `servicesKey` - Services section
   - `resumeKey` - Resume section
   - `skillsKey` - Skills section
   - `projectsKey` - Projects section
   - `contactKey` - Contact section

### How to Use Navigation

#### 1. Scroll to a Section
```dart
// Navigate to Skills section
ManagementRoute.scrollToSkills();

// Navigate to About section
ManagementRoute.scrollToAbout();

// Navigate to Projects section
ManagementRoute.scrollToProjects();
```

#### 2. Scroll to Top
```dart
ManagementRoute.scrollToTop();
```

#### 3. Check Current Section
```dart
String currentSection = ManagementRoute.getCurrentVisibleSection();
```

### Navigation Methods Available

- `scrollToHome()` - Scroll to home section
- `scrollToAbout()` - Scroll to about section
- `scrollToServices()` - Scroll to services section
- `scrollToResume()` - Scroll to resume section
- `scrollToSkills()` - Scroll to skills section
- `scrollToProjects()` - Scroll to projects section
- `scrollToContact()` - Scroll to contact section
- `scrollToTop()` - Scroll to top of page

## 🎨 Color Scheme

- **Primary Color**: `#FF006E` (Pink/Magenta)
- **Background**: `#0A0A0A` (Very Dark)
- **Surface**: `#1A1A1A` (Dark)
- **Card Background**: `#2A2A2A` (Medium Dark)
- **Text**: White and Grey variations
- **Accents**: Pink highlights throughout

## 📱 App Structure

```
lib/
├── main.dart                    # Main app entry point with all sections
├── core/
│   └── route/
│       └── mangement_route.dart # Scroll navigation system
└── README.md                    # This documentation
```

## 🏗️ Sections Overview

1. **Home Section** - Hero section with introduction and profile image
2. **About Section** - Personal information and highlighted skills
3. **Services Section** - Professional services in grid layout
4. **Resume Section** - Education and experience timeline
5. **Skills Section** - Technical skills with colorful icons
6. **Projects Section** - Portfolio projects showcase
7. **Contact Section** - Contact form and footer

## 🛠️ Customization

### Adding New Sections

1. Add a new GlobalKey in `ManagementRoute`:
```dart
static final GlobalKey newSectionKey = GlobalKey();
```

2. Add navigation method:
```dart
static void scrollToNewSection() {
  _scrollToSection(newSectionKey);
}
```

3. Add the section to the main page with the key:
```dart
Container(
  key: ManagementRoute.newSectionKey,
  child: const NewSection(),
),
```

### Modifying Colors

You can customize the color scheme by changing the color constants:

```dart
// Primary accent color
const Color(0xFFFF006E)

// Background colors
const Color(0xFF0A0A0A) // Very dark
const Color(0xFF1A1A1A) // Dark
const Color(0xFF2A2A2A) // Medium dark
```

### Modifying Scroll Behavior

Customize the scroll animation by modifying the `_scrollToSection` method:

```dart
static void _scrollToSection(GlobalKey key) {
  if (key.currentContext != null) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 1000), // Change duration
      curve: Curves.easeInOutCubic, // Change curve
      alignment: 0.1, // Change alignment (0.0 = top, 0.5 = center)
    );
  }
}
```

## 🚀 Running the App

1. Make sure you have Flutter installed
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run -d chrome` for web development
5. Or run `flutter run` for mobile development

## 📦 Dependencies

- `flutter`: ^3.8.1
- `cupertino_icons`: ^1.0.8
- `flutter_svg`: ^2.0.10+1
- `go_router`: ^16.1.0

## 🌐 Browser Support

This app works best on modern browsers that support:
- CSS Grid and Flexbox
- Smooth scrolling
- Modern JavaScript features

## ⚡ Performance Tips

- The app uses `SingleChildScrollView` for smooth scrolling
- Images and heavy content should be optimized
- Consider using `ListView.builder` for large lists
- Use `const` constructors where possible for better performance

## 🔮 Future Enhancements

- [ ] Add scroll-based animations
- [ ] Implement contact form functionality
- [ ] Add image assets for projects
- [ ] Add resume download functionality
- [ ] Implement analytics tracking
- [ ] Add SEO optimization for web
- [ ] Add loading animations
- [ ] Implement dark/light theme toggle

## 🤝 Contributing

Feel free to contribute to this project by:
- Reporting bugs
- Suggesting new features
- Submitting pull requests
- Improving documentation

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Design inspired by Hazem Said's portfolio
- Built with Flutter and Material Design 3
- Smooth scroll navigation implementation
"# my_Portfolio" 
