# Flutter-Tutorial

## 1. Giới thiệu Flutter – Tổng quan & lịch sử Flutter
- Flutter là gì, ai phát triển
- Ứng dụng thực tế của Flutter
- Ưu điểm, hạn chế, lý do nên học

## 2. So sánh Flutter vs Android Native – Phân tích, đối chiếu
- So sánh ngôn ngữ (Dart vs Java/Kotlin)
- Cách build UI (Widget vs XML Layout)
- Tốc độ phát triển, hiệu năng, tính đa nền tảng

## 3. Cài đặt môi trường & công cụ – Setup Flutter

### 3.1. Cài đặt Flutter trên macOS
- Yêu cầu hệ thống:
  - macOS (64-bit)
  - Ít nhất 2.8 GB dung lượng đĩa trống
  - Các công cụ command-line: bash, curl, git, mkdir, rm, unzip, which

- Các bước cài đặt:
  1. Tải Flutter SDK từ trang chính thức: https://docs.flutter.dev/get-started/install/macos
  2. Giải nén file tải về vào thư mục mong muốn (ví dụ: `~/development`)
  3. Thêm Flutter vào PATH (có nhiều cách):
     
     **Cách 1: Thêm tạm thời cho phiên làm việc hiện tại**
     ```bash
     export PATH="$PATH:`pwd`/flutter/bin"
     ```
     
     **Cách 2: Thêm vĩnh viễn vào file cấu hình shell**
     - Mở Terminal
     - Mở file cấu hình shell (tùy theo shell bạn đang sử dụng):
       ```bash
       # Nếu dùng Bash
       nano ~/.bash_profile
       # Hoặc nếu dùng Zsh
       nano ~/.zshrc
       ```
     - Thêm dòng sau vào cuối file (thay đổi đường dẫn phù hợp với nơi bạn đặt Flutter):
       ```bash
       export PATH="$PATH:/đường/dẫn/đến/flutter/bin"
       ```
     - Lưu file và thoát (Ctrl+O, Enter, Ctrl+X)
     - Áp dụng thay đổi:
       ```bash
       # Nếu dùng Bash
       source ~/.bash_profile
       # Hoặc nếu dùng Zsh
       source ~/.zshrc
       ```
  4. Chạy lệnh `flutter doctor` để kiểm tra và cài đặt các thành phần còn thiếu
  5. Cài đặt Xcode từ Mac App Store
  6. Cài đặt Android Studio và các SDK cần thiết
  7. Cấu hình các thiết bị iOS và Android để phát triển

### 3.2. Cài đặt Flutter trên Windows
- Yêu cầu hệ thống:
  - Windows 10 hoặc cao hơn (64-bit)
  - Ít nhất 1.64 GB dung lượng đĩa trống
  - Windows PowerShell 5.0 trở lên
  - Git for Windows

- Các bước cài đặt:
  1. Tải Flutter SDK từ trang chính thức: https://docs.flutter.dev/get-started/install/windows
  2. Giải nén file tải về vào thư mục mong muốn (ví dụ: `C:\src\flutter`)
  3. Thêm Flutter vào PATH hệ thống:
     - Tìm kiếm "env" trong Start menu
     - Chọn "Edit environment variables for your account"
     - Thêm đường dẫn đến thư mục `flutter\bin` vào biến Path
  4. Chạy lệnh `flutter doctor` trong Command Prompt để kiểm tra và cài đặt các thành phần còn thiếu
  5. Cài đặt Android Studio và các SDK cần thiết
  6. Cấu hình thiết bị Android để phát triển

- Chạy flutter doctor và tạo project đầu tiên
- Cấu hình emulator, android ios hoặc thiết bị thật

### 3.3. Cài đặt plugin Flutter vào Android Studio
1. Mở Android Studio
2. Truy cập vào menu Preferences/Settings:
   - Trên macOS: Android Studio > Preferences
   - Trên Windows: File > Settings
3. Chọn mục Plugins trong menu bên trái
4. Chọn tab Marketplace
5. Tìm kiếm "Flutter" trong ô tìm kiếm
6. Nhấn nút Install để cài đặt plugin Flutter
7. Cài đặt thêm plugin Dart nếu được yêu cầu
8. Khởi động lại Android Studio để áp dụng thay đổi

### 3.4. Tạo project Flutter bằng Android Studio
1. Mở Android Studio
2. Chọn "Create New Flutter Project" từ màn hình chào mừng
   - Hoặc chọn File > New > New Flutter Project
3. Chọn "Flutter Application" và nhấn Next
4. Cấu hình project:
   - Nhập tên project
   - Chọn vị trí lưu project
   - Xác nhận đường dẫn đến Flutter SDK
   - Nhập mô tả project (tùy chọn)
   - Chọn ngôn ngữ (Kotlin cho Android, Swift cho iOS)
5. Nhấn Finish để tạo project
6. Đợi Android Studio tạo và cấu hình project
7. Chạy ứng dụng:
   - Chọn thiết bị từ thanh công cụ (emulator hoặc thiết bị thật)
   - Nhấn nút Run (biểu tượng play màu xanh)

## 4. Cú pháp cơ bản trong Dart & Flutter – Giới thiệu ngôn ngữ Dart
- Cú pháp cơ bản: biến, kiểu dữ liệu, hàm, class, if/for
- Hàm main(), cấu trúc ứng dụng Flutter
- Widget cơ bản: Text, Button, Column, Row

## 5. Cấu trúc dự án Flutter – Giải thích project Flutter
- Thư mục lib, pubspec.yaml, android, ios, assets
- File main.dart và Widget tree
- Giải thích luồng chạy ứng dụng

## 6. Lập trình demo CRUD – Ứng dụng Flutter cơ bản
- Tạo app CRUD (VD: Danh bạ / Ghi chú)
- Thêm, sửa, xóa, xem dữ liệu (List hoặc sqflite)
- Demo chạy thực tế