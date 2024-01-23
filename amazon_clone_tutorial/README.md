# amazon_clone_tutorial

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// \*Hướng dẫn sơ cách chạy source:
// \*Lưu ý:
// \*Bắt buộc: là phải luôn kết nối Wifi cho máy ảo thì mới chạy được Ecommerce App: amazon_clone_tutorial.
// \*Và phải đăng nhập tài khoản Google và nhập thông tin thẻ thanh toán cho GPay (VD: Visa Card or Credit Card),
// \*thì mới thực hiện chức năng thanh toán được!

// 1. Trong file lib\constants\global_variables.dart
// \*Bắt buộc: Thay String uri = 'http://<yourid>:3000'; (Thay yourid = ip address của bạn)

// 2. \*Bắt buộc: Cài đặt NodeJS, sau đó mở Terminar và chạy dòng lệnh npm run dev
// Kết quả: connected at port 3000
// Connection Successful!

// 3. Trong file server\index.js
// \*Bắt buộc: Thay const DB = "mongodb+srv://tuongdvdev:<password>@cluster0.evdabeh.mongodb.net/?retryWrites=true&w=majority";
// \*Bắt buộc: Bằng cách tạo tài khoản MonggoDB trên Google rồi thay <password> bằng passpord đã tạo trên MonggoDB

// 4. Trong file lib\features\admin\services\admin_services.dart
// \*Bắt buộc: Thay final cloudinary = CloudinaryPublic('<cloudName>', '<presetName>');
// \*Bắt buộc: Bằng cách tạo tài khoản Cloudinary trên Google rồi thay <cloudName> và <presetName> đã tạo trên Cloudinary.

// => Sau cùng, khi đã hoàn thành hết tất cả bước trên thì chạy app bình thường trên Visual Studio Code rồi sử dụng các chức năng của Ecommerce App: amazon_clone_tutorial.
