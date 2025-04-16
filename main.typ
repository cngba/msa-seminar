#import "/iclr2025.typ": iclr2025

#let author-note = footnote[
  Use footnote for providing further information about author (webpage,
  Alternative address) --- *not* for acknowledging funding agencies.  Funding
  Acknowledgements go at the end of the paper.
]

/**
 * Authors should be specified as a list of entries. Each entry enumerates
 * authors with the same affilation and address. Field `names` is mandatory.
 */
#let authors = (
  (
    names: ([Lưu Nam Đạt], ),
    affilation: [ 22127062 ],
    email: "lndat22@clc.fitus.edu.vn",
  ),
  (
    names: ([Nguyễn Bá Công], ),
    affilation: [ 22127046 ],
    email: "nbcong22@clc.fitus.edu.vn",
  ),
  (
    names: ([Nguyễn Huỳnh Hải Đăng], ),
    affilation: [ 22127052 ],
    email: "nhhdang22@clc.fitus.edu.vn",
  ),
  (
    names: ([Đặng Trần Anh Khoa], ),
    affilation: [ 22127024 ],
    email: "dtakhoa22@clc.fitus.edu.vn",
  ),
)

#show: iclr2025.with(
  title: [Phân tích thống kê dữ liệu nhiều biến#linebreak()Seminar],
  authors: authors,
  keywords: (),
  abstract: [
    None
  ],
  bibliography: bibliography("biblio.bib"),
  appendix: [
    #include "appendix.typ"
  ],
  accepted: true,
)

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(
    title: "Mục lục",
    indent: auto,
)

#let url(uri) = link(uri, raw(uri))

= Phân tích tương quan chính tắc

== Khái niệm
== Phương pháp

== Nhận xét

Phương pháp: 

Tương quan giữa các biến chính tắc và các biến gốc:
- Các biến chính tắc không có tính chất tự nhiên nên khó phân ích

ý nghĩa hình học:
- Xét đại lượng mang giá trị thực

Cho A = [3 3 3 \\
		3 3 3 \\
		3 3 3]
		
$lambda_1 lambda_2 lambda_3
$

A^(1/2) = sqrt(lambda1) e1 e1^T + sqrt(lambda2) e2 e2^T + sqrt(lambda2) e2 e2^T 

== Thực nghiệm

- Tương quan truyền thống là gì? 
- Cần thực hiện so sánh phương pháp truyền thống và phương pháp mới, song song
- Cần có điều kiện bài toán và thông tin  kiểm nghiệm rõ ràng hơn

Tương quan chính tắc Mẫu

Kiểm định mô hình
= Phân tích thành phần chính


pca giảm chiều dữ liệu

tối ưu hiệu suất mô hình

--> phải nêu ra thách thức khi số chiều gia tăng, yêu cầu cấu hình lớn ra sao.
nhóm chưa nêu rõ vì sao cần giảm nhiễu

ý nghĩa khoa học:

- trích xuất thông tin quan trọng: 
thiếu: trong p biến, phải tìm được 1 không gian mới, không gian p chiều, về khoa học là tìm ra được một không gian mới
có số chiều thấp hơn dữ liệu đầu vào

dữ liệu nào không có tương 
làm như vậy, giúp dữ liệu có tính khả tắc

xấp xỉ sao cho sai số là thấp nhất có thể


- tối ưu hoá dữ liệu (how?)

ý nghĩa thực tiễn: 
- xử lý ảnh và thị giác máy tính: 
thiếu: tìm không gian con để chiếu dữ liệu mặt xuống không gian con mới
từ 1tr xuống còn 100 chiều, sau đó được lấy đi nhận dạng.

(nói chung chung)
- y học: giúp giảm chiều 

- NLP: (dữ liệu 

- Tài 


== phát biểu bài toán 

(tìm tập hợp mới các biến số)

(chưa biết thành phần chính là gì)

("giữ lại phần lớn phương sai còn lại" ???)

Tìm ra một không gian con `m` chiều thấp hơn số chiều của không gian của tập mẫu ban đầu  
- `m` biến không tương quan với nhau
- phương sai của `m` biến lớn nhất có thể
- sai số xấp xỉ trong không gian con `m` chiều là bé nhất

Input:
- tập dữ liệu dưới dạng ma trận X
- n là số mẫu
- p la số biến

Output:
Ma trận mới Z chứa các thành phần chính (???) giữ lại phần lớn phương sai (???) của dữ liệu gốc.

== Các công đoạn chính của hệ thống

PHƯƠNG PHÁP: ???

Tập mẫu, mỗi điểm đang được tính từ gốc toạ độ.

Ví dụ: Toạ độ

Chọn 1 điểm mới là sample mean, tức trung bình mẫu. Từ điểm này tạo thành trục mới e1, e2

$X = X - mu$

Subtract mean: toạ độ của tất cả các điểm còn lại sẽ được tính theo hệ toạ độ mới.

tính ma trận hiệp phương sai

- Tính trị riêng và vector riêng

$det(S - lambda I) = 0$

Chọn K vector riêng có giá trị riêng lớn nhất để xây dựng ma trận U

mỗi trục toạ độ của không gian con là 1 vector riêng.

chiếu sample lên không gian mới.

$ Z = hat(X) U_k$

== Phương pháp

$ X = U_K Z + macron(U)_K Y$


(mạch logic...?)

eigenface pca


kernel PCA: PCA kernel phi tuyến

Robust PCA tách dữ liệu thành phần chính và nhiễu:
N mẫu + p biến --> ma trận có k vector đặc trưng, có giảm số biến
Incremental PCA

==> Cần giải thích ra thành phẩm cụ thể của từng công trình, không hiểu rõ phương pháp và sự liên quan của nó với PCA gốc

= Phân lớp

Gắn nhãn cho 

Định nghĩa: nói quá nhanh, ko hiểu nói gì

Công đoạn 1: 

Công đoạn 2: Tập dữ liệu đã tiền xử lý

Input:
- tập dữ liệu đã tiền xử lý
- nhãn (labels)

Output: 
- Không gian đặc trưng tối ưu giúp phân tách rõ ràng giữa các lớp
==> Tập mẫu trong không gian mới có tính khả tắc

Công đoạn 3: Tìm luật phân lớp 

CĐ 3 mới là tìm luật phân lớp.

Ý nghĩa khoa học:

Ví dụ cũng chưa cụ thể.

Phân lớp, trong bài toán thực tế vì có liên quan đến tiên đoán (prediction).
Ví dụ: Ảnh u xương --> u đại bào, u tiểu bào, lành tính hay ác tính $->$ dẫn đến bài toán phân lớp


== Công trình nghiên cứu liên quan

LDA: Linear Discriminant Analysis

k-NN

SVM

== Thực nghiệm bài toán hai lớp



== Thực nghiệm bài toán đa lớp

Giải bài toán bằng LDA



Decision Tree


Giả định: Một số bộ dữ liệu có thể tuân theo hoặc không

Giả định 1 là về độ phân phối chuẩn.

Giả định 2:

Tìm một không gian con để chiếu tập mẫu xuống có tính khả tắc. Không gian con được tính bằng 


x là sample trong không gian p biến, 

tính sample của mình trong một không gian mới: m là tính cho không gian mới
$w * x$ là chuyển qua không gian mới

Between-class covariance matrix

$(m_1 - m_2)^2  = w^T (mu_1 - mu_2) (mu_1 - mu_2)^T w$

*Mẫu số chưa bao giờ là ma trận*


*Notes:*
- PCA, CCA, LDA, đều quy vào vector riêng - giá trị riêng
- Nhân tử Larange

= CLUSTERING - 

- +Vector đặc trưng của mẫu phải có tính khả tắc

- K-Means, Hierarchical Clustering (gom nhóm phân cấp)
Cần chọn ra cụm dữ liệu tối ưu
== ý nghĩa ứng dụng
Marketing, tâm lý học, khảo cổ, y học, xã hội học, ngôn ngữ, sinh học

== ý nghĩa khoa học
hiểu ban3n chất, đánh giá tính đa chiều, tìm outliers

== Phát biểu bài toán
Độ tương đồng
Có thể dùng độ đo tương đồng hoặc độ đo dị biệt

Đầu ra là tập y đại diện cho mỗi cluster

== Framework
Đầu vào là dataset có $n$ mẫu
Optional: k = số lượng cluster

Preprocessing: 
- Normalization
- Đơn giản hoá bằng cách giảm chiều: PCA

Similarity Measure:


- Partitioning: không phân cấp

Visualization:
- Dendrogram
- Chernoff
- Star

Output

== similar

Công thức tính Coefficient

Phân cụm dữ liệu nhị phân
nếu có nhiều item hơn thì sẽ so sánh được khoảng cách của chúng.
Nhược điểm là 
*tương đồng giữa 2 biến, không phải 2 mẫu*


*từ tiêu chí, đến quy luật*
= Thuật toán
- Agglomerative


Có thể thay bằng correlation matrix

- minh hoạ bằng dendrogram

single linkage là để tính ma trận khoảng cách, lấy 2 điểm dữ liệu gần nhau nhất
complete là xa nhất
... là trung bình

chọn ngưỡng theo từng bài toán? nhưng sẽ không biết giá trị cần chạy trên dendrogram

độ dị biệt giữa 1

(?) khi nào kết thúc gom cụm?

- khoảng cách giữa điểm-điểm, điểm-tập hợp đều có chung công thức

- Sau khi gán nhãn, không thể thay đổi

- +dàn bài không rõ: có phải là đang đưa các mẫu về cùng một nhóm? khi đã thành nhóm, distance thường phải bé nhất có thể
để làm được vậy, ta cần hiểu vì sao cây cần phải xoay như vậy?-- nói chưa rõ mục đích, gom như vậy thì đầu ra sẽ đạt được gì
- Chọn chiến lược linkage, cần thêm hình ảnh minh hoạ, cái nào mạnh, cái nào yếu

- k-means dựa trên tập mẫu và chia thành k cụm


= PHÂN LỚP

ý nghĩa ứng dụng
- phân loại đối tượng
- nhận diện cảm xúc

không thể phân lớp bằng mắt. 2 mẫu có thể rất giống nhau.
ví dụ trong y khoa, u xương ở trẻ em, tiến triển rất nhanh

nhận diện != nhận dạng: class ID?

== phát biểu bài toán
n điểm dữ liệu, d đặc trưng

số phần tử trong lớp thứ i là n
có k lớp khác nhau

1 quan sát có d đặc trưng

- INPUT LÀ MỘT 
ẩn số là đi tìm tiêu chí phân lớp, có thể gọi là hàm phân biệt

có 2 công đoạn: discriminant và classification

tìm lớp có giá trị phân biệt lớn nhất

- chưa có thông tin về rút trích đặc trưng

== phương pháp liên quan
- maximum likelihood discriminant

== LDA


- không có khái niệm phương sai giữa các lớp

- nhiều chi tiết toán không rõ?


= SUY DẪN KẾT QUẢ LIÊN QUAN ĐẾN QUẦN THỂ DỰA TRÊN THÔNG TIN MẪU


- ví dụ xác thực, code chu
- thiếu CDF

phương sai population

- giải thích phân phối student
Đặc điểm chính của phân phối Student:
- đối xứng quanh 0
- có hình chuông
- Phụ thuộc vào bậc tự do $n - 1$ 

Sau khi có được bậc tự do $n - 1$ và mức ý nghĩa $alpha$ thì ta có thể kiểm định giả thuyết.

Phân phối Fisher
sử dụng khi kiểm định giả thuyết và so sánh phương sai
cần bậc tự do của tử số và bậc tự do của mẫu số

=== Phương pháp
Đối với mẫu một biến

cái đã biết là là $mu_0$.

= TÁI LẤY MẪU (RESAMPLING)
Suy luận thống kê

- Lấy ví dụ về tái lấy mẫu
- Chưa rõ về việc tái lấy mẫu: mẫu xuất hiện mới sẽ từ đâu ra? mẫu có rồi thì sao?
- Ví dụ tái lấy mẫu nhằm mục đích gì?
- Phát biểu đồ án không rõ ngay từ đầu?

trung bình của nhóm có dùng thuốc mới và nhóm không dùng thuốc mới

= CÁC KHÁI NIỆM CƠ BẢN VỀ PTTKDLNB

- Variance được minh hoạ bằng độ dài của vector độ lệch

- Nhiều chi tiết chưa rõ ràng
- Giải thích tại sao là "hàm hợp lý"? Từ "hợp lý" từ đâu ra? Likelihood? Phải dịch là hàm triển vọng. Ước lượng triển vọng cực đại
Xác suất xuất hiện X1, X2 Xn là bao nhiêu?
- Tại sao phải ước lượng triển vọng cực đại? ta cần ước lượng xem các ẩn số phải tìm là bao nhiêu để tích đạt cực đại, khi đó xác suất đồng biện n mẫu là lớn nhất có thể.
- Trong tính toán hàm vật lý, vì hai hàm đồng biến, không thể lấy log vì "để bỏ đi $e$ mũ".
- Kiểm định giả thuyết:
- Kiểm định tỷ số hợp lý: $l_0$ ở đâu ra? Trang sau có liên quan gì đến trang trước.
- Kiểm định giả thuyết khi biết ma trận hiệp phương sai: ta cần biết gì? $mu$
