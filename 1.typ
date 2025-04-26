= CÁC CÂU HỎI

_1. So sánh Xác suất và Thống kê?_

#table(
    columns: 3,
    rows: auto,
    [Khái niệm], [Ngành toán nghiên cứu khả năng (độ chắc chắn) của các biến cố ngẫu nhiên.], [Ngành khoa học về thu thập, mô tả và suy diễn thông tin từ dữ liệu quan sát.],
    [Hướng suy diễn], [Từ quần thể (mô hình, giả thuyết) đến mẫu (kết quả ngẫu nhiên).], [Từ mẫu (dữ liệu quan sát) suy rộng ra quần thể (đặc tính chung).],
    [Đầu vào], [Dữ liệu giả định theo mô hình; thường là ký hiệu, tham số chưa biết.], [Dữ liệu thu thập được: số liệu mẫu, bảng biểu, biểu đồ…],
    [Mục đích], [Dự đoán xác suất xảy ra biến cố; xây dựng mô hình phân phối.], [Ước lượng tham số, kiểm định giả thuyết, mô tả đặc điểm dữ liệu.]
)

_2. Nêu ứng dụng thực tế có áp dụng Phân tích thống kê dữ liệu nhiều biến?_

- Phân tích mức độ tiêu thụ nhiên liệu của xe: Dựa vào các tham số như loại động cơ, loại nhiên liệu , thông số động lực học, trọng lượng của xe, loại lốp xe, điều kiện địa hình, mặt đường, cũng như lượng nhiên liệu đã tiêu thụ, sử dụng hồi quy tuyến tính để tính toán, phân tích và so sánh mức độ tiêu thụ nhiên liệu của xe.
- Phân tích mạng xã hội: Dựa vào những thông số của từng cá nhân và thông số tương tác giữa mỗi người, áp dụng gom nhóm và hồi quy tuyến tính để tìm hiểu sâu về mối quan hệ của con người trong xã hội.
- 
_3. Ý nghĩa của sample mean là gì?_

- Sample mean đại diện cho nhiều tính chất trong tập dữ liệu.
- Sample mean được ứng dụng để ước tính population mean.
- Trong Phân tích dữ liệu khai phá, sample mean là điểm trung bình tạo điều kiện cho việc phân tích. 
- Ngoài ra, sample mean còn được dùng trong các thuật toán học máy và thị giác máy tính để chuẩn hóa dữ liệu (normalization), giảm nhiễu, hoặc làm đặc trưng cho việc so sánh giữa các vùng dữ liệu

_4. Cho ví dụ trực quan cho thấy việc sử dụng sample mean không thể phản ánh được tính chất dữ liệu._

#image("images/mean-std.png", width: 70%, height: auto)

Trong một số trường hợp, phân phối của 2 tập dữ liệu là khác nhau, nhưng chúng có cùng sample mean. Vì vậy, ta cần có thêm thông số là sample variance để kiểm tra độ phân tán của dữ liệu.

Trong hình ảnh minh hoạ ở trên, tập dữ liệu được minh hoạ bằng màu xanh dương được trải đều trên cả trục `Ox`, còn tập màu đỏ chỉ nằm gọn ở giữa đồ thị. Điều đó có nghĩa là tập màu đỏ tuy có trung binh mẫu bằng với tập màu xanh, nhưng lại có phương sai mẫu thấp hơn rất nhiều so với tập màu xanh.

_5. Tại sao phương sai lại bình phương?_

Phương sai được bình phương để tránh các giá trị âm. Nếu các giá trị âm xuất hiện, được cộng với giá trị dương, thì chúng sẽ triệt tiêu nhau, làm sai lệch kết quả.
Nhưng thay vì sử dụng giá trị tuyệt đối, ta bình phương với mong muốn đẩy sai số lên cao, giúp phương sai phản ánh mức độ phân tán mạnh hơn so với trung bình.

_6. Tìm ví dụ trong khoa học dữ liệu thị giác có sử dụng trung bình mẫu (sample mean) và phương sai mẫu (sample variance)_

Giảm nhiễu trong ảnh y khoa, như ảnh scan MRI: 
- Trong một ô nhỏ chứa các điểm ảnh, sample mean có thể cho là giá trị màu thực của vùng ảnh, và phương sai mẫu đại diện cho độ nhiễu; phương sai càng cao, độ nhiễu càng lớn. 
- Non-local means là 1 thuật toán giúp giảm độ nhiễu của ảnh. Phương pháp là tính toán sample mean và sample variance giữa 2 vùng ảnh, để tìm ra 2 vùng ảnh có độ tương đồng giống nhau, sau đó cập nhật giá trị điểm ảnh là trung bình có trọng số các điểm ảnh tương ứng từ những vùng tương tự.

So sánh keypoint descriptor trong đặc trưng SIFT:
- Đòi hỏi tính toán sample mean và sample variance để tính khoảng cách giữa 2 descriptor (ví dụ: L2 distance).
- Được sử dụng trong các tác vụ so khớp đặc trưng


_7. Những thông số ở câu trên đáp ứng được những mục tiêu nào của MSA?_ 
MSA có 5 mục tiêu chính:
+ Giảm chiều dữ liệu, đơn giản hoá cấu trúc
+ Sắp xếp và gom nhóm
+ Khảo sát sự phụ thuộc giữa các biến
+ Dự đoán 
+ Xây dựng và Kiểm định giả thuyết

Trung bình mẫu và Phương sai mẫu đáp ứng chính cho mục tiêu: Xây dựng và kiểm định giả thuyết. Mean và Variance là nền tảng để ước lượng tham số, kiểm định giả thuyết (ví dụ: kiểm định t, kiểm định z).

Do hai thông số này là một trong những thông số cơ bản của bất kỳ bộ dữ liệu nào, nên chúng cũng có đáp ứng một phần cho 4 mục tiêu còn lại; tức là được sử dụng, nhưng phải phụ thuộc chính vào các phương pháp khác. 

_8. Hệ số tương quan: Chứng minh_ $|r_(i k)| lt.eq 1$

Hệ số tương quan Pearson giữa 2 biến ngẫu nhiên $X_i$ và $X_k$ được định nghĩa là:
$
  r_(i k) = frac("Cov"(X_i, X_k), sigma_i sigma_k)
$

với 
$
  "Cov"(X_i, X_k) = E[(X_i - mu_i)(X_k - mu_k)]
$
$
  sigma_i^2 = E[(X_i - mu_i)^2], sigma_k^2 = E[(X_k - mu_k)^2]
$
Ta xem 2 biến ngẫu nhiên $Y = X_i - mu_i$ và $Z = X_k - mu_k$.
Bất đẳng thức Cauchy cho kỳ vọng:
$
  |E[Y Z]| lt.eq sqrt(E[Y^2]) sqrt(E[Z^2])
$
Ta có:
$
  E[Y Z] = "Cov"(X_i, X_k)
$
$
  E[Y^2] = sigma_i^2, E[Z^2] = sigma_k^2
$
suy ra:
$
  |"Cov"(X_i, X_k)| lt.eq sigma_i sigma_k
$
Chia hai vế cho $sigma_i sigma_k gt 0$, ta được:
$
  |r_(i k)| = |frac("Cov"(X_i, X_k), sigma_i sigma_k)| lt.eq 1
$


_9. Nêu vai trò của hệ số tương quan_

Hệ số tương quan là thước đo thống kê về độ mạnh yếu cực kỳ quan trọng trong phân tích dữ liệu, vì đây là giá trị giúp xác định mối quan hệ giữa các biến

_10. Scatter plot và Dot diagram có những ưu - khuyết điểm gì?_


_11. Chứng minh:_ (1) $E(c^T x) = c^T mu$; (2) $"var"(c^T x) = c^T Sigma c$.

(1) Với vector ngẫu nhiên $x in RR^n$, giá trị kỳ vọng $mu = E[x]$, vector hằng số $c in RR^n$. 

Ta có:
$
  x = vec(x_1, x_2, ..., x_n),

  c = vec(c_1, c_2, ..., c_n),

  mu = EE[x] = vec(EE[x_1], EE[x_2], ..., EE[x_n])
$

$
  c^T x = sum^n_(i=1) c_i x_i
$
Lấy kỳ vọng:
$
  EE[c^T x] = EE[sum^n_(i=1) c_i x_i]
$
Theo tính chất của kỳ vọng:
$
   EE[c^T x] = sum^n_(i=1) c_i EE[x_i] = c^T mu
$
Cuối cùng ta được:
$
  EE[c^T x] = c^T EE[x]
$


