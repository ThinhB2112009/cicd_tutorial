# 1. Sử dụng image nền Ubuntu mới nhất
FROM ubuntu:latest

# 2. Thông tin tác giả
MAINTAINER Huy Thinh "thinhb2112009@student.ctu.edu.vn"

# 3. Cập nhật package
RUN apt update -y

# 4. Cài đặt pip và các gói cần thiết
RUN apt install -y python3-pip python3-dev python3-venv build-essential

# 5. Thêm mã nguồn vào thư mục /flask_app trong container
ADD . /flask_app

# 6. Chuyển vào thư mục làm việc
WORKDIR /flask_app

# 7. Tạo virtual environment
RUN python3 -m venv venv

# 8. Cài đặt các package từ requirements.txt vào virtual environment
RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

# 9. Đặt lệnh khởi động cho container
ENTRYPOINT ["./venv/bin/python"]

# 10. Chạy file Flask chính
CMD ["flask_docker.py"]

