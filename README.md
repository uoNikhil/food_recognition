## ABOUT THE PROJECT
This Personal Food Log App focuses on providing real time, high accuracy smartphone-based food calories detection App. This is a cross platform app, which allows user to click the picture of the food and get real time details of calories they will consume if they eat that item. The app can capture the photo through camera, uploading it to cloud, where it will be processed with our ML model, which would process the image to detect all visible individual ingredients, estimate its weight based on its surface area and calculate calories from density-volume table. This app outputs calories count and lets user track their data in easy-to-read visual format and would be capable of handling millions of food images a day. 

![combine_images (1)](https://user-images.githubusercontent.com/116195643/200438817-4e70d49d-1b9a-4d67-ae6d-3e68cfdd9682.jpg)

### Built With
The app is build using Flutter framework and the machine learning model is build with tensorflow which is deployed on AWS instance.

## Usage
You can install the app by downloading the APK from this GitHub page.
You need to login, after successful login you will be redirected to Overview page where you will promted to selct the meal type and then either click a picture through device camera or select an image from the gallery. This image will be uploaded to the cloud where it will be analysed thorugh out ML model which will then estimate the calories.
