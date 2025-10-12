# Flutter-Tutorial

## 1. Giới thiệu Flutter – Tổng quan & lịch sử Flutter

## Flutter là gì, ai phát triển:
    . Flutter là một framework mã nguồn mở do Google phát triển, được giới thiệu lần đầu vào năm 2017.

    . Dùng để xây dựng ứng dụng đa nền tảng (cross-platform), chỉ cần một codebase duy nhất có thể chạy trên Android, iOS, Web, Desktop và cả thiết bị nhúng.

    . Ngôn ngữ lập trình chính của Flutter là Dart, cũng do Google phát triển.

    . Flutter cung cấp bộ công cụ UI mạnh mẽ, giúp tạo ra giao diện người dùng đẹp, linh hoạt và hiệu năng cao.

## Ứng dụng thực tế của Flutter:
    . Google Ads: ứng dụng quảng cáo chính thức của Google.

    . Alibaba: sử dụng Flutter cho một phần hệ thống thương mại điện tử.

    . BMW, Toyota, eBay Motors, Reflectly: xây dựng các ứng dụng di động cao cấp.

    . Ở Việt Nam, một số startup và công ty phần mềm đã áp dụng Flutter để phát triển ứng dụng đa nền tảng.

## Ưu điểm:
    . Phát triển nhanh chóng: Hỗ trợ tính năng Hot Reload, giúp xem ngay kết quả khi thay đổi code mà không cần build lại toàn bộ ứng dụng.

    . Giao diện đồng nhất: Thay vì dùng XML hay HTML để xây dựng giao diện, Flutter dùng Widget — mọi thành phần trong Flutter (nút, văn bản, hình ảnh, bố cục, v.v.) đều là widget.

    . Nhờ có engine đồ họa riêng (Skia), Flutter vẽ trực tiếp giao diện lên màn hình, không phụ thuộc vào thành phần giao diện của hệ điều hành.

    . Hiệu năng cao: Biên dịch trực tiếp sang mã máy (native code), không cần lớp trung gian như React Native → chạy mượt và ổn định.

    . Cộng đồng lớn, thư viện phong phú: Có hàng nghìn package/plugin sẵn có trên pub.dev.

    . Đa nền tảng thực sự: Một codebase duy nhất cho Android, iOS, Web, và Desktop.

## Hạn chế:
    . Dung lượng ứng dụng lớn hơn so với native do cần gói thêm Flutter engine.

    . Một số API hệ thống chưa được hỗ trợ đầy đủ, đặc biệt trên iOS.

    . Hiệu suất xử lý đồ họa hoặc tác vụ nặng đôi khi kém hơn native.

    . Phụ thuộc vào Google, nếu Google ngừng hỗ trợ, Flutter có thể bị ảnh hưởng.
 
## Lý do nên học Flutter:
    . Phát triển đa nền tảng với một codebase → tiết kiệm thời gian và chi phí.

    . Nhu cầu tuyển dụng cao, đặc biệt ở các startup và công ty phần mềm hiện nay.

    . Dễ học, đặc biệt với người đã quen lập trình hướng đối tượng (Java, C#, JavaScript).

    . Thiết kế giao diện hiện đại, dễ tùy biến, phù hợp cho cả ứng dụng nhỏ và lớn.

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