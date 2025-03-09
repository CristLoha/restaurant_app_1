# Features 🚀  

## Authentication Page  
- Provides a login page for users to access the app.  
- Includes a registration page for new users to sign up.  
- Password fields are securely hidden for privacy.  
- Session data and tokens are stored in shared preferences to manage user flow:  
  - If logged in, users are redirected to the main page.  
  - If not, users are directed to the login page.  
- A logout feature is available on the main page to clear session data and tokens.  

## Story Page  
- Displays a list of stories retrieved from the API. Each story includes the user’s name and a photo.  
- Clicking on a story navigates to the detail page, displaying the user's name, photo, and description.  

## Add Story  
- Users can create and upload new stories.  
- A short description is required when adding a new story along with an image.  

## Advanced Navigation  
- Implements **Declarative Navigation** for smooth and efficient app flow.  
