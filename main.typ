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
  title: [Phân tích thống kê dữ liệu nhiều biến#linebreak()Bài tập lớp-nhà: Seminar],
  authors: authors,
  keywords: (),
  abstract: [
    Đây là phần Seminar của Bài tập Lớp - Nhà, môn Phân tích thống kê dữ liệu nhiều biến, thực hiện bởi nhóm Orz. Phần này ghi lại các đồ án của các nhóm khác trong lớp đã thực hiện trong suốt học kỳ.
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

#include "1.typ"

= PHÂN TÍCH TƯƠNG QUAN CHÍNH TẮC

== Khái niệm
Là một kỹ thuật thống kê đa biến nhằm phân tích tương quan giữa hai tập biến. Các biến trong mỗi tập sẽ không đông thời xuât hiện trong hai tập biến đang xét.

_Mục đích_:
- Xử lý dữ liệu đa chiều và đa nguồn (Multi-modal Data)
- Nhu cầu phân tích quan hệ nhân quả tiềm ẩn
- Ứng dụng trong công nghệ hiện đại

=== Ý nghĩa khoa học
- Khám phá mối quan hệ đa biến phức tạp
- Giảm chiều dữ liệu mà vẫn giữ được thông tin quan trọng
- Cung cấp nền tảng cho nghiên cứu liên ngành
- Hỗ trợ xây dựng mô hình dự đoán

=== Ý nghĩa ứng dụng
- Giáo dục, tâm lý học
- Sinh học, y tế
- Công nghệ và Trí tuệ nhân tạo

== Các công trình nghiên cứu liên quan
=== Sparse Canonical Correlation Analysis (SCCA)
_Định nghĩa_:
Phương pháp xác định các tổ hợp tuyến tính thưa thớt của hai tập biến có tương quan cao với nhau, phân tích dữ liệu genomic khi có hai tập hợp các phép

_Mục tiêu_:
- Tối đa hoá tương quan giữa các tổ hợp tuyến tính của 2 tập biến
- Tạo ra các vector canonical thưa thớt, từ đó thêm các hàm phạt vào bài toán tối ưu hoá

_Điểm mạnh_:
- Tính thưa thớt
- Dễ giải thích hơn
- Tính độc nhất
- Linh hoạt
- Ứng dụng trong genomic data

==== Công thức
maximize $w_1$, $w_2$
$
  w_1^T X_1^T X_2 w_2
$
subject to
$
  ||w_1||^2 lt.eq 1, ||w_2||^2 lt.eq 1, P_1(w_1) lt.eq c_1, P_2(w_2) lt.eq c_2
$
trong đó
- $w_1$, $w_2$ là các vector canonical (trọng số)
- $X_1$, $X_2$ là 2 tập dữ liệu
- $P_1$, $P_2$ là các hàm phạt convex, thường được chọn để tạo ra $w_1$ và $w_2$ thưa thớt
- $c_1$, $c_2$ là các tham số điều chỉnh độ thưa thớt

=== Deep Canonical Correlation Analysis (DCCA) 
_Định nghĩa_:
Phương pháp học sâu nhằm tìm các biểu diễn phi tuyến phức tạp của 2 tập dữ liệu, sao cho biểu diễn kết quả có tương quan tuyến tính cao nhất.

_Mục tiêu_: Học các biểu diễn phi tuyến từ hai tập dữ liệu bằng cách sử dụng mạng nơ-ron sâu, sau đó áp dụng CCA trên các biểu diễn đã học để tối ưu hoá tương quan giữa chúng.

_Điểm mạnh_: 
- Nhờ sử dụng mạng nơ-ron học sâu, DCCA có thể học các biểu diễn phi tuyến phức tạp 
- Không yêu cầu tích vô hướng, giúp giảm độ phức tạp tính toán
- Lợi thế của mô hình tham số (parametric model): Biểu diễn của dữ liệu mới có thể được tính toán mà không cần tham chiếu đến tập huấn luyện

_Điểm yếu_:
- Dù đã bớt được tích vô hướng, mạng nơ-ron sâu lại có độ phức tạp tính toán cao hơn nhiều, đồng thời đòi hỏi nhiều tài nguyên
- Các biểu diễn phi tuyến thường khó diễn giải hơn các biểu diễn tuyến tính

=== Probabilistic Canonical Correlation Analysis (PCCA)
_Định nghĩa_:
Phiên bản xác suất của CCA, trong đó mối quan hệ giữa 2 tập dữ liệu được mô hình hoá dưới dạng phân phối xác suất

_Mục tiêu_: 
Mô hình hoá mối quan hệ phức tạp giữa 2 tập dữ liệu bằng cách sử dụng một mô hình xác suất, từ đó tìm ra biểu diễn có tương quan cao nhất.

_Điểm mạnh_: 
- Xử lý dữ liệu thiếu và nhiễu hiệu quả thông qua mô hình xác suất.
- Cung cấp thông tin về độ tin cậy của kết quả

_Điểm yếu_:
- Ước lượng xác suất đòi hỏi nhiều tài nguyên tính toán
- Phức tạp và khó diễn giải hơn các mô hình tuyến tính

=== Multi-view Canonical Correlation Analysis (PCCA)
_Định nghĩa_:
MCCA mở rộng CCA để xử lý nhiều tập dữ liệu (multi-view) thay vì chỉ 2 tập, nhằm tìm thành phần chung

_Mục tiêu_: 
Tối đa hoá tương quan giữa các điểm dữ liệu khác nhau, trích xuất thành phần chung đại diện cho mối quan hệ xuyên suốt các tập dữ liệu.

_Điểm mạnh_: 
- Hỗ trợ nhiều view: Có thể đồng thời xử lý nhiều tập dữ liệu, phù hợp với các bài toán multi-modal learning
- Tổng quát hoá tốt: Mở rộng khả năng của CCA để áp dụng trong các bài toán phức tạp hơn

_Điểm yếu_:
- Khi số lượng view tăng, bài toán trở nên phức tạp hơn
- Đòi hỏi dữ liệu lớn để đạt được hiệu suất cao

== Phương pháp
Cho $bold(X)^(1)$ và $bold(X)^(2)$ lần lượt là vector ngẫu nhiên $(p times 1)$ và $(q times 1)$ chiều.
Để thuận tiện, ta xem như $p lt.eq q$.

Cho $Sigma_11$ và $Sigma_22$ lần lượt là các ma trận hiệp phương sai của $bold(X)^(1)$ và $bold(X)^(2)$. Cho $Sigma_12 = Sigma_21^T$ là ma trận phương sai giữa $bold(X)^(1)$ và $bold(X)^(2)$.

Với mỗi cặp vector, gọi là vector hệ số chính tắc $a in RR^p$, $b in RR^q$ bất kỳ, đặt:
$
  U = a^T X^(1), V = b^T X^(2)
$
là các tổ hợp tuyến tính của lần lượt $bold(X)^(1)$ và $bold(X)^(2)$.

$
  bold(X)^(1) = [X_1^(1), X_2^(1),...,X_p^(1)]^T
$
$
  bold(X)^(2) = [X_1^(2), X_2^(2),...,X_p^(2)]^T
$

*Tương quan giữa các biến chính tắc và các biến gốc:*

Các biến chính tắc không có các tính chất tự nhiên nên khó phân tích và đặt mối quan hệ với dữ liệu gốc
Để sử dụng được trực tiếp các biến chính tắc $U$, $V$, ta cần thu thập dữ liệu và thực hiện kiểm định thống kê.

Ta có thể xem tương quan giữa các biến gốc của mỗi tập biến với các biến chính tắc nhằm xác định mức độ tương quan của mỗi biến gốc với mối quan hệ giữa 2 tập biến.
Tương quan này có thể xác định từ các biến chính tắc của quần thể nên ta không cần thu thập dữ liệu.

*Liên hệ giữa CCA và các tương quan truyền thống:* 

Thay vì tương quan giữa 2 biến liên tục, CCA tìm tương quan lớn nhất cho tổ hợp tuyến tính của 2 tập biến 

$
  |"Corr"( bold(X)^(1), bold(X)^(2) )| =  |"Corr"( a bold(X)^(1), b bold(X)^(2) )| = frac((a b)"Cov"(bold(X)^(1), bold(X)^(2)),sqrt(a^2 "Cov"(bold(X)^(1))) sqrt(b^2 "Cov"(bold(X)^(2))))
$

Thay vì sử dụng từng đặc điểm riêng lẻ, CCA sẽ tìm ra các "biến tổng hợp" cho mỗi tập sao cho tương quan giữa chúng là cao nhất, qua đó làm nổi bật mối quan hệ tiềm ẩn giữa 2 nhóm đặc điểm này.

*Tương quan chính tắc mẫu:*

Ta không có được các ma trận hiệp phương sai của tổng thể, mà chỉ có dữ liệu các quan sát, vậy nên ta sử dụng ma trận hiệp phương sai mẫu làm ước tính cho ma trận hiệp phương sai của tổng thể.
Chỉ cần mẫu đủ lớn, ma trận hiệp phương sai của tổng thể có thể được ước lượng với sai số nhỏ thông qua ma trận hiệp phương sai của mẫu (tức phương sai mẫu hội tụ theo xác suất đến phương sai tổng thể). Vậy nên, chỉ cần thay thế phương sai tổng thể bằng phương sai mẫu.

*Kiểm định mô hình:*

Cho tương quan chính tắc đầu tiên khác 0 và các tương quan chính tắc còn lại bằng 0, sau đó kiểm tra giả thuyết trên.
Nếu giả thuyết bị bác bỏ, ta lại cho rằng hai bước chính tắc đầu tiên khác 0, và $p - 2$ biến chính tắc còn lại bằng 0 và tiếp tục kiểm định.
== Nhận xét

// Phương pháp: 

// Tương quan giữa các biến chính tắc và các biến gốc:
// - Các biến chính tắc không có tính chất tự nhiên nên khó phân ích

// ý nghĩa hình học:
// - Xét đại lượng mang giá trị thực

// Cho A = [3 3 3 \\
// 		3 3 3 \\
// 		3 3 3]
		
// $lambda_1 lambda_2 lambda_3
// $

// A^(1/2) = sqrt(lambda1) e1 e1^T + sqrt(lambda2) e2 e2^T + sqrt(lambda2) e2 e2^T 

// == Thực nghiệm

- Tương quan truyền thống là gì? 
- Cần thực hiện so sánh phương pháp truyền thống và phương pháp mới, song song
- Cần có điều kiện bài toán và thông tin kiểm nghiệm rõ ràng hơn

// Tương quan chính tắc Mẫu

// Kiểm định mô hình


// ##################################################################
// = PHÂN TÍCH THÀNH PHẦN CHÍNH


// pca giảm chiều dữ liệu

// tối ưu hiệu suất mô hình

// --> phải nêu ra thách thức khi số chiều gia tăng, yêu cầu cấu hình lớn ra sao.
// nhóm chưa nêu rõ vì sao cần giảm nhiễu

// ý nghĩa khoa học:

// - trích xuất thông tin quan trọng: 
// thiếu: trong p biến, phải tìm được 1 không gian mới, không gian p chiều, về khoa học là tìm ra được một không gian mới
// có số chiều thấp hơn dữ liệu đầu vào

// dữ liệu nào không có tương 
// làm như vậy, giúp dữ liệu có tính khả tắc

// xấp xỉ sao cho sai số là thấp nhất có thể


// - tối ưu hoá dữ liệu (how?)

// ý nghĩa thực tiễn: 
// - xử lý ảnh và thị giác máy tính: 
// thiếu: tìm không gian con để chiếu dữ liệu mặt xuống không gian con mới
// từ 1tr xuống còn 100 chiều, sau đó được lấy đi nhận dạng.

// (nói chung chung)
// - y học: giúp giảm chiều 

// - NLP: (dữ liệu 

// - Tài 


// == phát biểu bài toán 

// (tìm tập hợp mới các biến số)

// (chưa biết thành phần chính là gì)

// ("giữ lại phần lớn phương sai còn lại" ???)

// Tìm ra một không gian con `m` chiều thấp hơn số chiều của không gian của tập mẫu ban đầu  
// - `m` biến không tương quan với nhau
// - phương sai của `m` biến lớn nhất có thể
// - sai số xấp xỉ trong không gian con `m` chiều là bé nhất

// Input:
// - tập dữ liệu dưới dạng ma trận X
// - n là số mẫu
// - p la số biến

// Output:
// Ma trận mới Z chứa các thành phần chính (???) giữ lại phần lớn phương sai (???) của dữ liệu gốc.

// == Các công đoạn chính của hệ thống

// PHƯƠNG PHÁP: ???

// Tập mẫu, mỗi điểm đang được tính từ gốc toạ độ.

// Ví dụ: Toạ độ

// Chọn 1 điểm mới là sample mean, tức trung bình mẫu. Từ điểm này tạo thành trục mới e1, e2

// $X = X - mu$

// Subtract mean: toạ độ của tất cả các điểm còn lại sẽ được tính theo hệ toạ độ mới.

// tính ma trận hiệp phương sai

// - Tính trị riêng và vector riêng

// $det(S - lambda I) = 0$

// Chọn K vector riêng có giá trị riêng lớn nhất để xây dựng ma trận U

// mỗi trục toạ độ của không gian con là 1 vector riêng.

// chiếu sample lên không gian mới.

// $ Z = hat(X) U_k$

// == Phương pháp

// $ X = U_K Z + macron(U)_K Y$


// (mạch logic...?)

// eigenface pca


// kernel PCA: PCA kernel phi tuyến

// Robust PCA tách dữ liệu thành phần chính và nhiễu:
// N mẫu + p biến --> ma trận có k vector đặc trưng, có giảm số biến
// Incremental PCA

// ==> Cần giải thích ra thành phẩm cụ thể của từng công trình, không hiểu rõ phương pháp và sự liên quan của nó với PCA gốc

= PHÂN LỚP (1)
Đây là đồ án của nhóm Pass.
== Giới thiệu

_Định nghĩa_:

Phân lớp là quá trình xây dựng một mô hình học máy nhằm gán nhãn cho các đối tượng dựa trên các đặc trưng đã được quan sát; cụ thể là tìm một hàm số:
$
  C: RR^p arrow.r {1,2,...,g}
$
sao cho với mỗi vector đặc trưng $x$ thuộc $RR^p$, hàm $C$ sẽ gán cho $x$ một nhãn thuộc tập ${1,2,...,g}$.
Trong đó:
- $p$ là số lượng đặc trưng của đối tượng
- $g$ là số lượng lớp đã định nghĩa trước

=== Ý nghĩa khoa học
- Giải quyết bài toán phân biệt và phân loại
- Đóng góp về mặt lý thuyết cho các mô hình toán học hay thuật toán mới
- Hỗ trợ nghiên cứu khoa học: Kiểm định giả thuyết, khám phá cấu trúc dữ liệu
- Phát triển học máy và trí tuệ nhân tạo

=== Ý nghĩa ứng dụng
- Y tế và chăm sóc sức khoẻ: Chẩn đoán bệnh, phân tích hình ảnh y tế
- Tài chính - Ngân hàng: Đánh giá rủi ro, phát hiện gian lận
- Marketing và bán hàng: Phân khúc khách hàng, dự đoán xu hướng
- An ninh mạng: Phát hiện xâm nhập
- Xử lý ngôn ngữ: Phân loại văn bản
- Khoa học xã hội và Nghiên cứu thị trường: Phân tích khảo sát, dự đoán hành vi

== Phát biểu bài toán
_Đầu vào_:
- Tập dữ liệu huấn luyện:
$
  D_"train" = {(x_i, y_i)}^N_(i=1)
$
- Tập dữ liệu kiểm tra:
$
  D_"test" = {x_j}^M_(j=1)
$

_Đầu ra_:
- Hàm phân lớp:
$
  hat(y) = C(x), hat(y) in {1,2,...,g}
$
- Nhãn dự đoán cho các đối tượng mới:
$
  {hat(y)_j}^M_(j=1), hat(y)_j = C(x_j)
$

== Framework
=== Thu thập và tiền xử lý dữ liệu
_Đầu vào_: 
- Dữ liệu thô
- Nhãn

_Đầu ra_: Dữ liệu sạch đã qua xử lý

_Các bước_:
- Thu thập dữ liệu thô và nhãn tương ứng
- Xử lý các vấn đề của dữ liệu: thiếu giá trị, giá trị rỗng, nhiễu
- Tiền xử lý: Mã hoá biến định tính, chuẩn hoá dữ liệu
- Trả dữ liệu sạch

=== Phân tích phân biệt
_Đầu vào_: 
- Tập dữ liệu đã tiền xử lý
- Nhãn

_Đầu ra_: 
- Các quy tắc / hàm phân biệt cho việc gán nhãn
- Không gian đặc trưng tối ưu giúp phân tách rõ ràng giữa các lớp

_Các bước_:
- Phân tách sự khác biệt giữa các lớp
- Xây dựng các quy tắc / hàm phân biệt nhằm gán nhãn hiệu quả

=== Phân tích phân biệt
_Đầu vào_: 
- Các điểm dữ liệu mới cần phân loại
- Không gian đặc trưng tối ưu
- Hàm phân biệt

_Đầu ra_: Nhãn phân loại cho dữ liệu mới

_Các bước_:
- Tính toán giá trị phân biệt cho các điểm dữ liệu mới
- Gán nhãn dựa vào ngưỡng hoặc tiêu chí quyết định


== Công trình nghiên cứu liên quan

=== Phân tích phân biệt (Linear Discriminant Analysis)

LDA được giới thiệu lần đầu bởi R.A.Fisher vào năm 1936 và được mở rộng bởi C.R.Rao cho bài toán phân lớp đa nhóm vào những năm 1940. 
LDA được ứng dụng rộng rãi trong các bài toán phân loại dữ liệu đa biến với giả định toán học thuần tuý.

_Các bước:_
- Tìm tổ hợp tuyến tính của các đặc trưng sao cho sự phân tách giữa các lớp là tối ưu.
- Tối đa hoá tỷ lệ giữa khoảng cách giữa trung bình các lớp và độ phân tán trong từng lớp.

_Phân tách phân biệt:_ Tìm hướng chiếu $w$ để tối đa hoá hàm mục tiêu
$
  J(w) = "Khoảng cách giữa các lớp" / "Độ phân tán trong lớp"
$

_Phân loại:_
- Chiếu mẫu mới $x$ lên $w$: $y = w^t x$
- Tính khoảng cách giữa $y$ và trung bình các lớp
- Gán nhãn cho mẫu giữa trên khoảng cách nhỏ nhất.

=== Hồi quy Logistic (Logistic Regression)

Hồi quy Logistic được phát triển bởi David Cox vào năm 1958 và được áp dụng rộng rãi từ những năm 1970 dưới dạng các mô hình tuyến tính tổng quát.
Điểm đặc biệt là mô hình trực tiếp ước lượng *xác suất hậu nghiệm* ($P(Y = 1 | X)$), tức là xác suất để 1 mẫu đầu vào $X$ thuộc về lớp 1, mà không cần giả định rằng các đặc trưng đầu vào tuân theo phân phối chuẩn.

==== Nguyên lý tổng quát
Giai đoạn phân tích phân biệt: Mô hình hoá logit và ước lượng các tham số $v$ và $b$ qua phương pháp Triển vọng cực đại.

Giai đoạn phân loại:
- Tính xác suất dự đoán:
$
  hat(p) = 1 / 2 + e^(-(w^T x) + b)
$
- Gán nhãn: nếu $hat(p) > -0.5$ thì $x$ thuộc lớp 1, ngược lại thuộc lớp 0. Ngưỡng có thể được điều chỉnh theo yêu cầu bài toán.

=== K-nearest Neighbors
*Giới thiệu*: 
Khái niệm k-NN được giới thiệu lần đầu bởi Fix & Hodges (1951) và được hoàn thiện bởi Cover & Hart (1967).
Đây là phương pháp không tham số, sử dụng dữ liệu huấn luyện để phân loại mẫu mới dựa trên khoảng cách trong không gian đặc trưng.

*Nguyên lý*:
- Dựa trên bộ nhớ: lưu trữ toàn bộ dữ liệu huấn luyện
- Phân loại mẫu mới bằng cách tìm *k* mẫu gần nhất theo khoảng cách và áp dụng nguyên tắc bỏ phiếu đa số.

*Cơ chế hoạt động*: Lưu trữ toàn bộ tập huấn luyện 
$
  {(x_i, y_i)}^n_(i=1)
$
và hình thành không gian đặc trưng qua các khoảng cách.

Các bước:
- Tính khoảng cách từ mẫu mới $x$ đến tất cả các mẫu huấn luyện
- Chọn $k$ mẫu có khoảng cách nhỏ nhất
- Gán nhãn có $x$ theo quy tắc bỏ phiếu đa số từ $k$ giá trị đó.

=== Cây quyết định - Decision Tree
*Giới thiệu*:
Cây quyết định là thuật toán học có giám sát được sử dụng cho phân loại và hồi quy, được giới thiệu bởi Ross Quinlan, sau này được Breiman et al. mở rộng thành CART.

*Các bước*:
- Tính toán độ đo thông tin (Entropy, Information Gain, Gini index, hoặc Gain Ratio) cho từng đặc trưng để đánh giá mức độ phân tách dữ liệu của chúng.
- Chọn đặc trưng tốt nhất để phân chia dữ liệu, dựa trên độ đo đã tính ở bước 1 (thường là đặc trưng có Information Gain cao nhất hoặc Gini index thấp nhất).
- Tạo nút phân chia trên cây với đặc trưng vừa chọn. Mỗi nhánh con tương ứng với một giá trị (hoặc một khoảng giá trị) của đặc trưng đó.
- Đệ quy áp dụng các bước trên cho từng nhóm con dữ liệu tại mỗi nhánh con.
- Dừng quá trình phân chia khi: Tất cả các mẫu trong một nhóm con thuộc cùng một lớp (dữ liệu thuần nhất); hoặc không còn đặc trưng nào để phân chia; hoặc đạt đến độ sâu tối đa đã định trước hoặc số lượng mẫu tại nút quá nhỏ ( để tránh overfitting).
- Gán nhãn lớp cho các lá (nút cuối) dựa trên đa số mẫu trong nhóm con đó (nếu dữ liệu chưa thuần nhất hoàn toàn).

=== Support Vector Machine
SVM được giới thiệu bởi Boser, Guyon, và Vapnik vào năm 1992 và phổ biến năm 1995.

*Phương pháp*:
SVM tìm 1 siêu mặt phẳng để phân chia 2 lớp dữ liệu:
$
  f(x) = w^T x + b = 0
$
với:
- $w$ là vector trọng số (pháp tuyến với siêu phẳng)
- $b$ là bias
- $x$ là đầu vào

Điểm $x$ được phân loại theo dấu của $f(x)$.

Support vectors là những điểm dữ liệu gần nhất với siêu mặt phẳng. Margin là khoảng cách từ siêu mặt phẳng đến các support vector. Ta muốn tối đa hoá margin:
- Khoảng cách đến siêu phẳng là $1 / (||w||)$.
- Hai lớp phải cách nhau ít nhất $2 / (||w||)$.

Với dữ liệu tuyến tính hoàn toàn phân biệt được (hard-margin), ta tìm $w$, $b$ sao cho:
$
  (w, b) = arg min_(w,b) 1/2 ||w||^2_2
$
với ràng buộc:
$
  y_i(w^T x_i) + b >= 1 forall i
$
trong đó:
- $(x_i, y_i)$ là các điểm huấn luyện
- $y_i in {-1, 1}$

Ta giải bài toán bằng cách xây dựng hàm Lagrange:
$
  L(w, b, alpha) = 1/2 ||w||^2 - sum_i alpha_i [y_i (w^T x_i + b) - 1]
$
- Tối ưu hoá bài toán Lagrange với $w$, $b$
- Tìm cực đại với $alpha_i gt.eq 0$
Tuy nhiên, việc giải bài toán này phức tạp khi số chiều $d$ của không gian dữ liệu và số điểm dữ liệu $N$ tăng cao.
Người ta thường giải bài toán đối ngẫu của bài toán này, vì bài toán đối ngẫu có những tính chất mới để có thể giải nhanh và hiệu quả hơn.
Kết quả biến đổi:
$
  max_alpha sum_i alpha_i - 1/2 sum alpha_i alpha_j y_i y_j x_i^T x_j
$
với ràng buộc:
$
  sum_i alpha_i y_i = 0, alpha_i gt.eq 0
$
Sau khi tìm được $alpha$, ta tính:
$
  w = sum_i alpha_i y_i x_i
$
Chọn 1 support vector để tính $b$:
$
  b = y_k - w^T x_k
$
Trường hợp dữ liệu không tuyến tính, ta thêm _soft-margin_ với tham số $C$ để cho phép một số điểm vi phạm margin.

== Phương pháp
Mục tiêu của LDA là tìm ra một tổ hợp tuyến tính của các biến ban đầu sao cho khi chiếu dữ liệu sang 1 không gian có chiều thấp hơn, các lớp được tách biệt rõ ràng hơn. Điều này được thể hiện thông qua việc tối đa hoá tỷ số giữa độ phân tán giữa các lớp và độ phân tán trong lớp.

Hàm mục tiêu được diễn đạt như sau:

*_Giả định 1:_*
Giả sử tồn tại K lớp, và dữ liệu của mỗi lớp $C_j$ được mô hình hoá bởi phân phối chuẩn đa biến, nghĩa là:
$
  x | C_j tilde.op N(mu_j, Sigma_j), j = 1, ..., K
$
hay hàm mật độ của lớp $C_j$ được cho bởi:
$
  f_j(X) = 1 / ( (2 pi)^(P/2) |Sigma_j|^(1/2) ) exp {-1/2 (x - mu_j)^T Sigma_j^(-1) (x - mu_j)}
$
trong đó:
- $x$ là vector quan sát có $p$ thành phần
- $mu_j$ là vector trung bình của lớp $C_j$
- $Sigma_j$ là ma trận hiệp phương sai của lớp $C_j$.

_Ý nghĩa_:
- LDA sử dụng trung bình và phương sai để đo độ phân tán dữ liệu của mỗi lớp.
- Nếu dữ liệu không tuân theo phân phối chuẩn, việc sử dụng trung bình và phương sai để đánh giá sẽ không còn chính xác, dẫn đến việc xác định sai cấu trúc của dữ liệu.

*_Giả định 2:_*
Giả sử các lớp có các ma trận hiệp phương sai $Sigma_1, Sigma_2, ..., Sigma_k$, và chúng bằng nhau:
$
  Sigma_1 = Sigma_2 = ... = Sigma_k = Sigma
$

_Ý nghĩa_:
Giả định đảm bảo sự lan toả của dữ liệu (bao gồm cả phương sai và hiệp phương sai) là như nhau ở tất cả các lớp, từ đó các thành phần không phụ thuộc vào $x$ trong log-likelihood là giống nhau với mọi lớp. Điều này giúp rút gọn biểu thức so sánh giữa các lớp và chứng minh rằng ranh giới phân lớp là tuyến tính.

LDA sử dụng ma trận hiệp phương sai chung (within-class covariance matrix, được tính bằng tổng các ma trận hiệp phương sai của từng lớp) để đánh giá độ phân tán của dữ liệu. Nếu các lớp có ma trận hiệp phương sai khác nhau, tổng hiệp phương sai nhỏ không còn phản ánh chính xác độ phân tán nhỏ của từng lớp, dẫn đến suy giảm hiệu quả phân tách tuyến tính.

Qua chứng minh, định tính tuyến tính của ranh giới phân lớp của mô hình LDA được khẳng định, với giả định trên.

*_Giả định 3:_* Dữ liệu i.i.d. và tham số không đổi

Các quan sát ${x_1, x_2, ..., x_n}$ là các biến độc lập và có cùng phân phối trong một lớp.
Các tham số $mu_j$ và $Sigma$ không thay đổi theo thời gian (không có hiện tượng concept drift).

_Ý nghĩa:_
- Giả định này đảm bảo rằng mỗi mẫu được thu thập đều đến từ cùng 1 phân phối xác định, cho phép ước lượng các tham số mô hình một cách ổn định.
- Việc không thay đổi các tham số theo thời gian tạo điều kiện thuận lợi cho quá trình học và đánh giá mô hình, đảm bảo tính nhất quán trong toàn bộ quá trình quan sát.

_Các đại lượng đo độ phân tán:_
Giả sử dữ liệu được chia thành 2 lớp $C_1$ và $C_2$ với số mẫu $N_1$, $N_2$ tương ứng, mỗi quan sát $x in RR^p$. Khi chiếu dữ liệu lên một hướng $w$, trung bình sau chiếu của mỗi lớp được tính như sau:
$
  m_1 = 1/N_1 sum_(x in C_1) w^T x \
  m_2 = 1/N_2 sum_(x in C_2) w^T x
$

Tương tự, độ phân tán (sai số) của mỗi lớp sau chiếu được định nghĩa là:
$
  s_1^2 = sum_(x in C_1)(w^T x - m_1)^2 \
  s_2^2 = sum_(x in C_2)(w^T x - m_2)^2
$

_Between-class covariance matrix:_
Khoảng cách giữa 2 điểm sau chiếu được đo bằng hiệu của trung bình các điểm sau chiếu, cụ thể:
$
  (m_1 - m_2)^2 = w^T (mu_1 - mu_2) (mu_1 - mu_2)^T w
$
Ta định nghĩa between-class covariance matrix:
$
  S_B = (mu_1 - mu_2)(mu_1 - mu_2)^T
$
Như vậy ta có:
$
  (m_1 - m_2)^2 = w^T S_B w
$


*Hàm mục tiêu của LDA*:
_Mục tiêu:_
Mục tiêu của LDA là tìm một hướng $w$ sao cho tỷ số giữa độ phân tán giữa lớp và độ phân tán trong lớp được tối đa hoá.
Ban đầu, ta xây dựng hàm mục tiêu dựa trên đại lượng đo sự phân tán:
$
  J(w) = frac((m_1 - m_2)^2,s_1^2 + s_2^2)
$
trong đó:
- $m_1$, $m_2$ là trung bình các điểm sau chiếu của từng lớp
- $s_1^2$, $s_2^2$ là tổng bình phương sai lệch của các điểm so với trung bình trong từng lớp

_Hàm mục tiêu biểu diễn qua_ $S_B$ _và_ $S_W$:
$
  J(w) = frac(w^T S_B w, w^T S_W w) 
$

*Các bước thực hiện LDA cho 2 lớp*:
- Giải bài toán eigenvalue: 
$
  S_W^-1 S_B w = lambda w
$
- Chọn nghiệm tối ưu: Sắp xếp các trị riêng (eigenvalue) theo thứ tự giảm dần rồi chọn vector riêng (eigenvector) ứng với trị riêng lớn nhất làm nghiệm tối ưu $w ast.basic$
- Chiếu dữ liệu: Với mỗi $x$, tính giá trị chiếu:
$
  y = (w ast.basic)^T x
$
- Phân lớp: Xác định ngưỡng (thường là trung điểm của $(w ast.basic)^T mu_1 $ và $(w ast.basic)^T mu_2 $) để gán nhãn cho các điểm dữ liệu

*Các bước thực hiện LDA cho đa lớp*:
- Tính trung bình cho mỗi lớp $mu_k$ và trung bình chung $mu$.
- Within-class covariance:
$
  S_W = sum^C_(k=1) sum_(x in C_k) (x - mu_k) (x - mu_k)^T
$
- Between-class covariance:
$
  S_B = sum^C_(k=1) N_k (mu_k - mu) (mu_k - mu)^T
$
- Giải bài toán eigenvalue:
$
  S_W^(-1) S_B W = lambda W 
$
với $lambda = J(W)$ 
- Chọn nghiệm tối ưu: Sắp xếp các trị riêng theo thứ tự giảm dần và chọn các eigenvector ứng với các giá trị lớn nhất để tạo thành $W ast.basic$, với số cột của $W ast.basic$ không vượt quá $C - 1$.
- Chiếu dữ liệu: Với mỗi $x in RR^D$, tính:
$
  y = (W ast.basic)^T x
$
- Phân lớp: Gán nhãn cho $x$ dựa trên khoảng cách của $y$ đến các trung bình chiếu của các lớp.

== Nhận xét
- Các nội dung bị lướt qua nhanh, gây khó hiểu
- Ví dụ chưa cụ thể
- Không có khái niệm phương sai giữa các lớp
- Nhiều chi tiết toán không rõ?

/*
*Notes:*
- PCA, CCA, LDA, đều quy vào vector riêng - giá trị riêng
- Nhân tử Larange
*/

= PHÂN LỚP (2)
Đây là đồ án của nhóm Vstatic.
== Giới thiệu
=== Ý nghĩa ứng dụng
- Phân loại đối tượng
- Phân loại hình ảnh
- Phân loại khách hàng
- Nhận diện cảm xúc

=== Mục tiêu
Xây dựng một hàm phân biệt để gán một quan sát $x$ có $d$ đặc trưng, vào 1 trong $k$ lớp, sao cho tối ưu được độ phân biệt giữa các lớp.

Xét trường hợp 2 lớp và đa lớp.

== Công trình liên quan
=== Phân biệt Triển vọng cực đại - Maximum Likelihood Discriminant:
Gán x vào hàm có mật độ xác suất lớn nhất, tức là lớp  có khả năng sinh ra x cao nhất theo mô hình giả định: 

$
C* = arg max (C_k in C)  p(x | C_k)
$

=== Phân loại bằng định lý Bayes
Áp dụng định lý Bayes để tính xác suất hậu nghiệm, và chọn xác suất hậu nghiệm lớn nhất.
Xác suất tiên nghiệm là xác suất ta có được trước khi thực hiện quan sát x và thực hiện phân lớp x vào tập cụ thể w. (công thức xác suất hậu nghiệm)

=== Phân biệt tuyến tính LDA
Phân tích Thành phần Chính (Principal Component Analysis - PCA), vốn chỉ
tập trung vào việc giữ lại phương sai tổng thể của dữ liệu mà không xét đến
thông tin về nhãn lớp.
Tuy nhiên, việc giữa lại thông tin nhiều nhất không đồng nghĩa với việc giúp
phân loại tốt nhất.
Để giải quyết bài toán này, LDA giúp tăng cường khả năng phân biệt giữa các
nhóm dữ liệu, từ đó cải thiện hiệu suất của các thuật toán phân loại.

== Thực nghiệm
=== Bài toán 2 lớp
Xác định xem một tờ tiền là giả hay thật.
Đầu vào: hình ảnh từ máy quét tiền 
Đầu ra: Giá trị boolean: Đây là tiền thật hay tiền giả?

Linear Discriminant Analysis
Phương pháp:
1. Tính toán trung tâm lớp
2. Tính ma trận hiệp phương sai trong lớp (within-class covariance)
3. Tính ma trận hiệp phương sai giữa các lớp (between-class covariance)
4. Tính vector chiếu tối ưu (tìm vector riêng tương ứng với trị riêng lớn nhất)
5. Chiếu dữ liệu sang không gian mới (bằng vector w)
6. Phân loại bằng Nearest Centroid Classifier: Tức là gán nhãn 

$arrow.r.double$ Đạt được độ chính xác $96.73%$ trên tập dữ liệu kiểm tra

=== Bài toán đa lớp
Tên bài toán: Khảo sát dữ liệu cho NASA

*Thách thức:*

- Chiều dữ liệu rất cao: rất nhiều đặc trưng gắn với mỗi ngôi sao
- Chồng chéo giữa các lớp
- Khối lượng dữ liệu khổng lồ, không thể phân loại bằng tay

*Bài toán phân lớp ngôi sao:*
- Dựa vào đặc trưng vật lý: nhiệt độ, độ sáng, bán kính, độ lớn tuyệt đối, màu sắc, phân loại quang phổ
- Mục tiêu phân loại: Giá trị phân loại ứng với các loại ngôi sao: Red Dwarf, Brown Dwarf, White, Main Sequence, Super Giants, Hyper Giants
- Đầu vào: Các tham số về ngôi sao
- Đầu ra: Giá trị phân loại ngôi sao

*Giải bài toán:*
- Within-class Variance: thể hiện độ phân tán của các điểm dữ liệu trong 1 class. Kết quả là các vector riêng cùng phương trình giá trị riêng.
- Lựa chọn và sắp xếp các vector riêng: Nhằm giữ lại nhiều thông tin phân biệt nhất giữa các lớp
- Chiếu dữ liệu vào không gian mới.
- Phân loại bằng Nearest Centroid Classifier


Nhận xét dữ liệu trước khi thực hiện bài toán:
- Có sự chồng chéo đáng kể
- Đặc trưng 0 không phải là một đặc trưng tốt để phân biệt rõ ràng tất cả các lớp

Sau khi thực hiện:
- Phân tách đáng kể
- Vẫn còn tồn tại sự chồng chéo

== Nhận xét

= CLUSTERING

== Giới thiệu
Clustering là kỹ thuật quan trọng trong Phân tích thống kê đa biến, giúp nhóm các quan sát dựa trên sự tương đồng mà không cần gán nhãn trước.

Mục tiêu:
- Tìm cấu trúc ẩn trong dữ liệu đa biến
- Hỗ trợ khám phá mô hình
- Phân tích dữ liệu thăm dò
- Giảm chiều dữ liệu

Thách thức:
- Xác định số cụm tối ưu
- Xử lý dữ liệu nhiều chiều

=== Ý nghĩa khoa học
- Hiểu bản chất phức tạp của các mối quan hệ đa biến
- Đánh giá mức độ đa chiều của dữ liệu
- Xác định ngoại lai
- Đề xuất các giả thuyết thú vị về mối quan hệ giữa các đối tượng

=== Ý nghĩa ứng dụng
- Marketing: Chọn các thị trường thử nghiệm; Phân loại và cơ cấu công ty theo tổ chức
- Tâm lý học: Tìm ra các loại tính cách trên cơ sở các bảng câu hỏi
- Khảo cổ học: Phân loại các đồ vật nghệ thuật trong các thời kỳ khác nhau
Các ngành khoa học khác: y học, sinh học, xã hội học, ngôn ngữ học. 

Trong mỗi trường hợp, một mẫu các đối tượng không đồng nhất được phân tích với mục đích xác định các nhóm con đồng nhất

== Phát biểu bài toán
Đầu vào:
- Một tập hợp gồm $N$ điểm dữ liệu không gán nhãn
$
  X = {x_i | x_i in RR^p, 0 lt.eq i lt.eq N}
$
- Hàm đo độ tương đồng giữa 2 điểm dữ liệu
$
  s(x_i, x_j)
$
- Hàm đo khoảng cách giữa 2 điểm dữ liệu
$
  d(x_i, x_j)
$

Đầu ra: Một tập hợp gồm $M$ nhãn tương ứng với $N$ điểm dữ liệu
$
  Y = {y_i | y_i in {0,1,...,M-1}, 0 lt.eq i lt.eq N}
$

== Phương pháp
Framework:
+ Nhập dữ liệu đầu vào (Input)
+ Tiền xử lý dữ liệu: Normalization, Standardization, Đơn giản hoá dữ liệu
+ Tính toán độ tương đồng (Similarity Measure): l1-norm (Manhattan), l2-norm (Euclidean), Jaccard, $X^2$ matrice
+ Gom nhóm (Clustering)
+ Trực quan hoá dữ liệu: Dendrogram, Chernoff, Star
+ Trả kết quả: `.csv` file cùng đồ thị biểu diễn


=== Similarity Measure

Đo độ tương đồng dựa vào khoảng cách (distance) hoặc mức độ tương quan Coefficient giữa các item/variable.

Một số yếu tố cần xem xét khi lựa chọn một loại thang đo độ tương đồng:
- Biến rời rạc, liên tục, hay nhị phân?
- Thang đo của feature
- Kiến thức chuyên môn của lĩnh vực đang thực hiện

- Có nhiều cách để đo lường sự tương đồng giữa các cặp đối tượng. Hầu hết các nhà nghiên cứu sử dụng tiêu chí khoảng cách (distance measures) hoặc hệ số tương đồng (correlation coefficient)
- Đối với kiểu biến nhị phân, có thể tính distance measure theo l1-norm, l2-norm. Tính hệ số tương quan coefficient theo Simple Matching, Jaccard, Russell & Rao, Dice,...
- Đối với biến liên tục: Tính khoảng cách bằng lr-norm (Minkowski distance), Mahalanobis distance, Cosine distance. Tính hệ số tương quan theo Pearson.

=== Thuật toán Gom nhóm

1. *Hierarchical*

1.1. Agglomerative - Gom cụm: Bắt đầu ở phân vùng nhỏ nhất, mỗi mẫu là 1 cụm, sau đó đi gom dần dữ liệu lại thành cụm.
- Single Linkage Distance: Khoảng cách giữa hai cụm được tính là khoảng cách ngắn nhất giữa hai điểm ở hai cụm.
- Complete Linkage Distance: Khoảng cách giữa hai cụm được tính là khoảng cách xa nhất giữa hai điểm ở hai cụm.
- Average Linkage Distance: Khoảng cách giữa hai cụm được tính là trung bình các khoảng cách giữa tất cả các điểm ở hai cụm.
- Ward method: Tìm cách giảm thiểu tổng bình phương sai số (Total Within-Cluster Variance) khi gom cụm.

_Thuật toán Gom cụm phân cấp_:
+ Xây dựng phân cụm nhỏ nhất, mỗi đối tượng là một cụm riêng lẻ
+ Tính toán ma trận khoảng cách $D$
+ Tìm 2 cụm có khoảng cách nhỏ nhất
+ Gom 2 cụm đó thành 1 cụm mới
+ Cập nhật lại ma trận khoảng cách $D$ sau khi hợp nhất cụm

Lặp lại các bước 3 - 5 cho đến khi tất cả các cụm được hợp nhất thành 1 cụm X duy nhất.

_Kết luận_:
- Không xem xét về sai số và hàm lỗi nên phương pháp này nhạy cảm với các giá trị ngoại lai và nhiễu
- Khi đối tượng đã được phân cụm thì không thể sửa lại, vì vậy cần cẩn trọng sai sót từ giai đoạn đầu.
- Những giá trị bằng nhau trong ma trận khoảng cách hoặc độ tương đồng có thể tạo ra nhiều lời giải khác nhau cho bài toán gom cụm phân cấp.

1.2. Splitting - Phân cụm: Cho tất cả mẫu thành 1 nhóm, sau đó tách ra dần dần thành các cụm nhỏ hơn.

2. *Partitioning* (Non-hierarchical): Khởi đầu với $k$ cụm bằng cách gom ngẫu nhiên dữ liệu ở gần tâm cụm lại, chấp nhận rủi ro gán nhầm; sau đó hoán đổi các phần tử giữa các cụm theo 1 tiêu chí nhất định (ví dụ: Khoảng cách so với tâm cụm mới).

Kỹ thuật này được thiết kế để nhóm các đối tượng thay vì biến số vào 1 tập hợp gồm K cụm. Số cụm K có thể được xác định trước hoặc được xác định trong quá trình phân cụm.

Do không cần xây dựng ma trận khoảng cách (độ tương đồng), và dữ liệu cơ bản không cần phải lưu trữ trong quá trình thực thi, các phương pháp phân cụm phi phân cấp có thể áp dụng trên các tập dữ liệu lớn hơn nhiều so với các phương pháp phân cụm phân cấp.

Các phương pháp phân cụm phi phân cấp thường bắt đầu bằng:
- Phân nhóm ban đầu các đối tượng vào các cụm
- Chọn một tập hợp các điểm trung tâm ban đầu, chúng sẽ hình thành hạt nhân của các cụm.

_Thuật toán K-Means Clustering_:
1. Phân chia dữ liệu thành K cụm ban đầu
2. Duyệt qua danh sách các đối tượng, gán mỗi đối tượng vào cụm có trung tâm gần nhất. 
- Sử dụng khoảng cách Euclidean, với dữ liệu chuẩn hoá hoặc không chuẩn hoá.
- Cập nhật lại trung tâm cụm khi 1 điểm dữ liệu mới được thêm vào và khi 1 điểm rời khỏi cụm trước đó.
3. Lặp lại bước 2 cho đến khi không còn sự thay đổi nào trong việc gán cụm.

Sự khác biệt giữa Hierarchical và Partitioning:
- Hierarchical: Nếu dữ liệu đã gán cụm rồi thì không thể thay đổi được nữa.
- Partitioning: Có thể thay đổi nhãn của cụm dữ liệu, tuỳ vào quá trình chạy

== Nhận xét
- Chọn chiến lược linkage, cần thêm hình ảnh minh hoạ, cái nào mạnh, cái nào yếu
- Trình bày chưa rõ ràng về mục đích thực hiện phân cụm
- Chưa biết được khi nào kết thúc gom cụm

// = PHÂN LỚP


// không thể phân lớp bằng mắt. 2 mẫu có thể rất giống nhau.
// ví dụ trong y khoa, u xương ở trẻ em, tiến triển rất nhanh

// nhận diện != nhận dạng: class ID?

// == phát biểu bài toán
// n điểm dữ liệu, d đặc trưng

// số phần tử trong lớp thứ i là n
// có k lớp khác nhau

// 1 quan sát có d đặc trưng

// - INPUT LÀ MỘT 
// ẩn số là đi tìm tiêu chí phân lớp, có thể gọi là hàm phân biệt

// có 2 công đoạn: discriminant và classification

// tìm lớp có giá trị phân biệt lớn nhất

// - chưa có thông tin về rút trích đặc trưng

// == phương pháp liên quan
// - maximum likelihood discriminant



= SUY DẪN KẾT QUẢ LIÊN QUAN ĐẾN QUẦN THỂ DỰA TRÊN THÔNG TIN MẪU

== Giới thiệu
*Thống kê suy luận* là một phương pháp thống kê được sử dụng để đưa ra dự đoán hoặc suy luận về một quần thể dựa trên mẫu dữ liệu. 

_Vai trò:_
Diễn giải dữ liệu, tiến đến đưa ra kết luận thực tiễn, hữu ích, tiếp tục tiến đến sử dụng cho các quyết định trong tương lai.

=== Ý nghĩa khoa học
- Khả năng tổng quát hoá (generalization) và dự đoán (prediction)
- Tăng hiệu quả và tính khả thi trong việc thu thập dữ liệu trong nghiên cứu

=== Ý nghĩa ứng dụng
- Kiểm soát chất lượng và quản lý rủi ro: Kiểm tra một nhóm mẫu từ mỗi lô sản xuất, nhằm giám sát chất lượng sản phẩm
- Phục vụ y khoa và dịch vụ y tế công cộng: Thu thập dữ liệu mẫu để theo dõi mức độ lây lan của bệnh trong một vùng, giúp lên kế hoạch cho các biện pháp can thiệp và phân bố nguồn lực hợp lý.
- Nghiên cứu về môi trường và xã hội: Thu thập dữ liệu về chất lượng không khí từ một vài trạm giám sát để đánh giá mức độ ô nhiễm trong 1 thành phố, qua đó đề xuất các chính sách cải thiện chất lượng không khí.

== Phát biểu bài toán
_Đầu vào:_
- Một tập mẫu ngẫu nhiên $(X_1, X_2, X_3, ..., X_n)$ được lấy từ một quần thể.
- Giả thuyết không ($H_0$): Vector trung bình thực sử của quần thể ($mu$) bằng với vector trung bình kiểm định của quần thể ($mu_0$). 
$
  H_0: mu eq mu_0
$ 
- Giả thuyết thay thế ($H_1$): Vector trung bình thực sự của quần thể ($mu$) khác với vector trung bình của quần thể mà ta kiểm định ($mu_0$)
$
  H_1: mu eq.not mu_0
$
- Mức ý nghĩa $alpha$: Xác suất cho phép mắc lỗi loại I (tức lỗi bác bỏ $H_0$ mặc dù $H_0$ đúng).

_Đầu ra:_ Bác bỏ hoặc không bác bỏ giả thuyết $H_0$, dựa vào kiểm định thống kê.

== Phương pháp
=== Một số phân phối cần thiết

*Phân phối t* (hay còn gọi là phân phối Student's t) là một loại phân phối xác suất được sử dụng khi:
- Kích thước mẫu ($n$) nhỏ.
- Phương sai tổng thể ($sigma^2$ ) chưa biết.
Nó thường được dùng để kiểm định giả thuyết hoặc xây dựng khoảng tin cậy cho giá trị trung bình của một quần thể.

_Đặc điểm chính:_
- Đối xứng quanh 0.
- Có hình chuông.
- Phụ thuộc vào bậc tự do $n - 1$ (degrees of freedom - df), với $n$ là kích thước mẫu.
- Khi bậc tự do tăng lên (kích thước mẫu lớn), phân phối t tiến gần đến phân phối chuẩn.
- Mức ý nghĩa $alpha$ là một ngưỡng mà ta đặt ra để quyết định xem có bác bỏ giả thuyết ban đầu $H_0$ hay không. 
- Sau khi xác định bậc tự do và mức ý nghĩa, ta có thể sử dụng bảng phân phối T để tra giá trị tương ứng.

*Phân phối Fisher* là một loại phân phối xác suất được đặt tên theo nhà thống kê Ronald Fisher.
Sử dụng phân phối F khi:
- So sánh hai phương sai.
- Kiểm định giả thuyết liên quan đến nhiều biến.

Để tra bảng phân phối Fisher, chúng ta cần biết hai giá trị: 
- Bậc tự do của tử số (numerator degrees of freedom) được tính bằng công thức: $p - 1$, với $p$ là số nhóm dữ liệu mà chúng ta đang so sánh.
- Bậc tự do của mẫu số (denominator degrees of freedom) được tính bằng công thức: $n - p$, với n là tổng số quan sát và $p$ là số nhóm dữ liệu.

=== Mẫu một biến
Ta có các mẫu ngẫu nhiên từ một quần thể chuẩn. Để kiểm chứng xem giả thuyết có hợp lý hay không, ta sử dụng thống kê kiểm định t.
$
  t = frac(macron(X) - mu_0, s / sqrt(n))
$

Trong đó:
- $mu_0$ là trung bình của quần thể theo giả thuyết.
- $macron(X) = 1/N sum^n_(j=1) X_j$ là trung bình mẫu.
- $s^2 = 1/(n-1) sum^n_(j=1) (X_j - macron(X))^2 $ là phương sai của mẫu.
- $n$ là số phần tử có trong mẫu.

Kết quả này tuân theo phân phối t với $n - 1$ bậc tự do.

Ta bác bỏ $H_0$ khi $|t|$ lớn hay bình phương của nó lớn, tức là bác bỏ $H_0$ để chấp nhận $H_1$ ở mức ý nghĩa $alpha$ nếu:
$
  n(macron(x) - mu_0)(s^2)^(-1)(macron(x) - mu_0) > t^2_(n-1) (alpha / 2)
$

Ta không bác bỏ $H_0$ khi:
$
  |frac(macron(x) - mu_0, s / sqrt(n))| < t_(n-1) (alpha / 2)
$

Tổng kết: Với giá trị kiểm định thống kê t có phân phối t với $n-1$ bậc tự do:
- Tính $t_(n-1) (alpha / 2)$ bằng cách tra bảng phân phối t với $n-1$ bậc tự do.
- Nếu $|t| gt t_(n-1) (alpha / 2)$ thì ta bác bỏ $H_0$.
- Nếu $|t| lt.eq t_(n-1) (alpha / 2)$ thì ta không bác bỏ $H_0$.

=== Mẫu nhiều biến
Với trường hợp mẫu có nhiều biến, giả sử số biến là $p$.

$
  T^2 = n (macron(X) - mu_0)' S^(-1) (macron(X) - mu_0)
$
_Dấu chấm phẩy là thay cho chữ T, tức chuyển vị ma trận._

Trong đó:
- $mu_0$ là trung bình của quần thể theo giả thuyết. ($p times 1$)
- $macron(X) = 1/N sum^n_(j=1) X_j$ là trung bình nhóm mẫu được chọn. ($p times 1$)
- $s^2 = 1/(n-1) sum^n_(j=1) (X_j - macron(X)) (X_j - macron(X))' $ là ước lượng hiệp phương sai của tập mẫu được chọn ($p times p$). $(X_j - macron(X))$ có $p times 1$ chiều.
- $n$ là số phần tử có trong mẫu.

=== Các bước giải bài toán kiểm định
+ Phát biểu giả thuyết không $H_0$ và giả thuyết thay thế $H_1$.
+ Xác định mức ý nghĩa $alpha$
+ Tính trung bình mẫu, độ lệch chuẩn (một biến) hoặc ma trận hiệp phương sai (đa biến)
+ Tính giá trị kiểm định thống kê, giá trị tới hạn
+ Xác định miền bác bỏ
+ Kết luận bác bỏ hay không bác bỏ giả thuyết $H_0$ với độ tin cậy $(1 - alpha)$

== Nhận xét
- Ví dụ xác thực, code đạt chuẩn 
- Thiếu CDF
- Cần giải thích phân phối student


// = TÁI LẤY MẪU (RESAMPLING)
// Suy luận thống kê

// - Lấy ví dụ về tái lấy mẫu
// - Chưa rõ về việc tái lấy mẫu: mẫu xuất hiện mới sẽ từ đâu ra? mẫu có rồi thì sao?
// - Ví dụ tái lấy mẫu nhằm mục đích gì?
// - Phát biểu đồ án không rõ ngay từ đầu?

// trung bình của nhóm có dùng thuốc mới và nhóm không dùng thuốc mới

= CÁC KHÁI NIỆM CƠ BẢN VỀ PHÂN TÍCH THỐNG KÊ DỮ LIỆU NHIỀU BIẾN

== Phát biểu bài toán
Tên bài toán: Ứng dụng kiểm định vào View Synthesis

Đầu vào: Tập dữ liệu ảnh chụp từ nhiều vị trí / góc nhìn

Đầu ra: Khẳng định tập dữ liệu ảnh có đủ "dày" không

== Phương pháp 1: Hình học mẫu
Cách biểu diễn hình học của dữ liệu nhiều biến trong không gian Euclid, giúp trực quan hóa mối quan hệ giữa các biến và các quan sát.

*Vai trò:*
- Trực quan hóa dữ liệu phức tạp
- Đo lường mối quan hệ giữa các biến và quan sát 
- Hỗ trợ phương pháp phân tích đa biến .

== Phương pháp 2: Phân phối chuẩn đa biến
Phân phối chuẩn đa biến với trung bình $mu$ và ma trận hiệp phương sai có hàm mật độ xác suất là:
$
  f(x) = 1 / sqrt(|2 pi |Sigma||)exp(-1/2 (x - mu)^T Sigma^(-1) (x - mu))
$
Trong đó:
- $x$ là vector điểm dữ liệu cần tính mật độ xác suất
- $mu$ là vector trung bình
- $Sigma$ là ma trận hiệp phương sai
- $(x - mu)^T Sigma^(-1) (x - mu)$ là khoảng cách Mahalanobis giữa $x$ và $mu$. 

Công thức này mở rộng hàm mật độ của phân phối chuẩn một chiều sang nhiều chiều, với khoảng cách Mahalanobis thay thế cho khoảng cách Euclid để phản ánh mối quan hệ giữa các biến.

*Phép biến đổi Mahalanobis*: Chuẩn hoá phân phối chuẩn đa biến thành phân phối chuẩn độc lập

*Tính chất*:
- Bảo toàn phân phối chuẩn dưới phép biến đổi tuyến tính
- Phân phối chuẩn nhiều chiều có điều kiện

== Phương pháp 3: Hàm hợp lý và Thống kê kiểm định
=== Hàm hợp lý
Xét một mẫu độc lập, phân phối giống nhau ${x_i}^n_(i=1)$. Mỗi giá trị $x_i$  được giả định tuân theo một phân phối xác suất với hàm mật độ xác suất (PDF) $f(x;0)$ với $theta$ là tham số chưa biết cần ước lượng.

Hàm hợp lý được định nghĩa là xác suất (hoặc mật độ) của toàn bộ mẫu dữ liệu đã quan sát, được xem như là một hàm của $theta$:

$
  L(X;theta) = Pi^n_(i=1) f(x_i;theta)
$

Hàm này phản ánh mức độ "hợp lý" của tham số $theta$ trong việc tạo ra dữ liệu đã quan sát.

Ước lượng hợp lý cực đại: Là tìm giá trị tham số $theta$ thoả mãn $L(X;theta)$ đạt giá trị lớn nhất.
$
  hat(theta) = arg max_theta L(X;theta)
$

Để đơn giản hóa việc tính toán, đặc biệt khi làm việc với tích của nhiều hàm, ta thường sử dụng hàm hợp lý logarit:
$
  l(X;theta) = log L(X;theta) = sum^N_(i=1) log f(x_i;theta)
$

=== Kiểm định giả thuyết
Trong bài toán kiểm định giả thuyết, ta có:
- Giả thuyết không ($H_0$) là giả thuyết cần kiểm định. Tập hợp các giá trị thuộc $H_0$ được kí hiệu là $Omega_0$.
- Giả thuyết đối ($H_1$) là giả thuyết đối lập với giả thuyết không. Tập hợp các giá trị thuộc $H_1$  được kí hiệu là $Omega_1$.

Hai loại sai lầm trong kiểm định giả thuyết:
- Sai lầm loại I xảy ra khi bác bỏ $H_0$, mặc dù nó đúng.
- Sai lầm loại II xảy ra khi bác bỏ $H_1$, mặc dù nó sai.

Xác suất xảy ra sai lầm loại I được gọi là mức ý nghĩa, ký hiệu là $alpha$.

Miền bác bỏ: Tập hợp các giá trị của thống kê kiểm định mà khi rơi vào đó, ta bác bỏ giả thuyết không.

*Kiểm định tỷ số hợp lý*:
Kiểm định một tham số $theta$ trong mô hình phân phối đa biến chuẩn $N_p(theta, I)$:
- $H_0$: $theta eq theta_0$ (giá trị cụ thể đã biết)
- $H_1$: $theta eq.not theta_0$

Để đánh giá mức độ phù hợp của $H_0$, ta so sánh giá trị hợp lý cực đại khi $H_0$ đúng và khi $H_1$ đúng. Với mẫu ngẫu nhiên $X$, ta có tỷ số hợp lý:

$
  lambda(X) = frac(L^star_0, L^star_1)
$

Trong đó:
- $L^star_0$ là giá trị cực đại của hàm hợp lý khi ủng hộ $H_0$.
- $L^star_1$ là giá trị cực đại của hàm hợp lý khi ủng hộ $H_1$.

Kiểm định tỷ số hợp lý với mức ý nghĩa $alpha$ để kiểm định $H_0$ so với $H_1$ có miền bác bỏ $R$:
$
  R = {X : lambda(X) < c}
$
với $c$ là một ngưỡng xác định, sao cho xác suất bác bỏ $H_0$ không vượt quá mức ý nghĩa.

// - Variance được minh hoạ bằng độ dài của vector độ lệch
== Nhận xét
- Nhiều chi tiết chưa rõ ràng
- Giải thích tại sao là "hàm hợp lý"? Từ "hợp lý" từ đâu ra? Likelihood? Phải dịch là hàm triển vọng. Ước lượng triển vọng cực đại
// Xác suất xuất hiện $X1$$, X2 Xn là bao nhiêu?
- Tại sao phải ước lượng triển vọng cực đại?
Giải đáp: Ta cần ước lượng các tham số chưa biết sao cho hàm hợp lý - tức là tích của các hàm mật độ xác suất (hoặc hàm khối xác suất) của $n$ mẫu quan sát - đạt giá trị lớn nhất. Khi đó, mô hình với các tham số này giải thích dữ liệu đã quan sát là hợp lý nhất.
- Trong tính toán hàm vật lý, vì hai hàm đồng biến, không thể lấy $log$ vì "để bỏ đi $e$ mũ".

Kiểm định giả thuyết:
- Kiểm định tỷ số hợp lý: $l_0$ ở đâu ra? Trang sau có liên quan gì đến trang trước
- Kiểm định giả thuyết khi biết ma trận hiệp phương sai: ta cần biết gì? $mu$

= Phân tích yếu tố (Factor analysis)
== Giới thiệu
*Phân tích yếu tố* là một kỹ thuật thống kê, sử dụng để khám pha cấu trúc cơ bản của một tập hợp các biến bằng cách xác định một số lượng nhỏ hơn các biến tiềm ẩn không thể quan sát được gọi là các yếu tố. Về bản chất, phân tích yếu tố có mục đích giải thích các mối tương quan hoặc hiệp phương sai giữa nhiều biến quan sát được bằng cách tiết lộ các chiều cơ bản chung của chúng.

Khác với phân tích thành phần chính (PCA) tập trung vào giải tích phương sai tối đa, phân tích yếu tố mô hình hóa cụ thể hiệp phương sai giữa các biến, giả định rằng các biến quan sát được là các tổ hợp tuyến tính của các yếu tố cơ bản cộng với các thành phần phương sai duy nhất. Tiền đề cơ bản là các mối tương quan giữa các biến tồn tại vì các biến này có chung các yếu tố.

=== Ý nghĩa khoa học
- Hiển thị các cấu trúc ẩn: cung cấp một khuôn khổ toán học để phát hiện các yếu tố cơ bản không thể đo lường trực tiếp nhưng lại ảnh hưởng đến các biến quan sát được.
- Phân tích yếu tố được sử dụng để xác minh các công trình lý thuyết có phù hợp với mô hình dữ liệu thực nghiệm hay không.
- Nghiên cứu tính đa chiều: giúp xác định có bao nhiêu chiều có ý nghĩa tồn tại trong một tập hợp các biến tương quan, cung cấp thông tin chi tiết về tính phức tạp của hiện tượng đang được nghiên cứu.

=== Ý nghĩa ứng dụng
- Giảm lượng dữ liệu: Cô đọng các tập hợp biến lớn thành một số lượng yếu tố nhỏ hơnd, giúp dữ liệu phức tạp dễ quản lý và dễ diễn giải hơn.
- Phát triển thang đo: Khi phát triển các công cụ đo lường hoặc khảo sát, phân tích nhân tố giúp xác định các mục đo lường cùng một cấu trúc cơ bản, cho phép đo lường hiệu quả và hợp lệ hơn.

== Phát biểu bài toán
_Đầu vào:_
- Ma trận dữ liệu đa biến $X$ chứa các phép đo của $p$ biến trong $n$ quan sát. Mỗi hàng biểu diễn một quan sát và mỗi cột biểu diễn một biến. Thường được trình bày dưới dạng ma trận tương quan ($R$) hoặc ma trận hiệp phương sai ($S$) cho thấy mối quan hệ giữa các biến.
- Đặc điểm kỹ thuật của mô hình: Số lượng yếu tố k cần trích xuất (trong đó $k$ < $p$), lựa chọn phương pháp ước tính (khả năng xảy ra tối đa, các yếu tố chính, các thành phần chính)

_Đầu ra:_
- Ma trận tải yếu tố (Q): Ma trận $p times k$ chứa các hệ số biểu diễn cách mỗi biến tải lên từng yếu tố. Các phần tử $q j #sym.ell$  biểu thị mối tương quan giữa biến $j$ và yếu tố #sym.ell. Các tải giúp giải thích ý nghĩa của từng yếu tố.
- Phương sai cụ thể ($Psi$): Ma trận đường chéo chứa các phương sai duy nhất ($Psi j j$) cho mỗi biến Biểu diễn một phần của phương sai của biến không được giải thích bởi các yếu tố chung.
- Điểm tương đồng ($h^2$): Đối với mỗi biến, tỷ lệ phương sai của biến được giải thích bởi các yếu tố chung, được tính là tổng các tải trọng yếu tố bình phương cho biến đó $h^2 j = Sigma(q^2 j #sym.ell)$ cho biến $j$ trên tất cả các yếu tố
- Điểm số yếu tố: Giá trị ước tính của các yếu tố ngầm cho mỗi quan sát trong tập dữ liệu.
- Thông số đánh giá độ phù hợp (Model Fit statistics): Các biện pháp cho biết mô hình yếu tố xấp xỉ ma trận tương quan hoặc ma trận hiệp phương sai quan sát được tốt như thế nào.

Mối quan hệ toán học giữa đầu vào và đầu ra có thể được thể hiện thông qua phương trình phân tích nhân tố cơ bản:
$
X = Q F + U + mu
$
Trong đó $X$ là ma trận dữ liệu đầu vào, $Q$ (tải trọng), $F$ (yếu tố) và $U$ (yếu tố cụ thể) biểu thị các thành phần đầu ra và $mu$ là vector trung bình.

== Phương pháp
=== Mô hình phân tích yếu tố (Factor Analysis model)
Với các giả định:
- $E(F) = 0$ (các yếu tố có giá trị trung bình bằng không)
- var($F$) = $I_k$ (các yếu tố không tương quan và được chuẩn hóa)
- $E(U) = 0$ (các yếu tố cụ thể có giá trị trung bình bằng không)
- Cov($U_i, U_j$) = 0 đối với $i != j$ (các yếu tố cụ thể không tương quan)
- Cov($F, U$) = 0 (các yếu tố chung và cụ thể không tương quan)
- Var($U$) = $Psi$ = diag($Psi_(1 1), ..., Psi_(p p)$) (ma trận chéo của các phương sai cụ thể)
Dựa trên các giả định này, cấu trúc hiệp phương sai của X là:
$
Sigma = E[(X-mu)(X-mu)'] = Q Q' + Psi
$

Đối với mỗi biến $X_j$, ta có thể viết:
$
X_j = sum_(ℓ=1)^k q_(j ℓ) F_ℓ + U_j + μ_j
$
Phương sai của $X_j$ là:
$
  text("Var")(X_j) = sum_(ℓ=1)^k q²_(j ℓ) + Psi_(j j)
$
Trong đó $h^2_j = sum_(ℓ=1)^k q^2_(j ℓ)$ được gọi là điểm tương đồng(phương sai chung).

=== Phương pháp hợp lý cực đại (Maximum Likelihood Method-MLM)
Phương pháp này giả định tính chuẩn đa biến và tối đa hóa hàm log-likelihood:
$
#sym.ell (X; mu; Q; Psi)= -n/2 [log{abs(2π(Q Q' + Ψ))}+tr{(Q Q' + Ψ)^(-1)S}]
$
Trong đó: n là kích thước mẫu, S là ma trận hiệp phương sai mẫu, tr là toán tử theo dõi

Kiểm tra tính đầy đủ của mô hình với k yếu tố sử dụng thống kê tỷ lệ khả năng:
$
-2log(text("likelihood ratio")) = n log(abs(Q Q' + Psi) / abs(S))
$
Theo sau phân phối $chi^2$ xấp xỉ với $[(p-k)^2-(p+k)]/2$ bậc tự do.

=== Phương pháp nhân tố chính (Principal Factor Method)
+ Bắt đầu bằng ước tính ban đầu ở điểm tương đồng $tilde(h)_j$ (sử dụng tương quan bội bình phương hoặc tương quan tuyệt đối tối đa).
+ Tính toán ước tính phương sai cụ thể: $
tilde(Psi) _ j j = 1 - tilde(h)^2_j
$
+ Tạo ma trận tương quan rút gọn: $
R - tilde(Psi)
$
+ Thực hiện phân tích phổ: $
R - tilde(Psi) = sum_(ell=1) ^p gamma_#sym.ell gamma_(#sym.ell gamma')_ell
$
+ Giữ nguyên k vectơ riêng đầu tiên tương ứng với k giá trị riêng lớn nhất
+ Tính toán tải nhân tố: 
$
q_(ell) = sqrt(lambda_ell) gamma_ell text("với") #sym.ell = 1,...,k
$
+ Tính toán phương sai cụ thể đã cập nhật: $
tilde(Psi)_j j = 1 - sum_(#sym.ell=1)^k) q²_(j #sym.ell)
$
+ Lặp lại các bước 3-7 cho đến khi hội tụ.

=== Phương pháp thành phần chính (Principle Component Method)
+ Chéo hóa ma trận hiệp phương sai mẫu: $S = Gamma Lambda Gamma'$
+ Lấy k vector riêng và giá trị riêng đầu tiên để xây dựng các hệ số tải nhân số: $accent(Q, "^")=[sqrt(lambda_1) gamma_1, ..., sqrt(lambda_k) gamma_k]$
+ Ước tính các phương sai cụ thể như các phần tử đường chéo của

$S- accent(Q, "^") accent(Q, "^")'$: $accent(Psi, "^")_(j j)=s_(j j) - sum_(ell=1)^k accent(q, "^")^2_(j ell)$

Xấp xỉ của phương pháp thỏa: $
sum(i,j)(S-accent(Q, "^") accent(Q, "^") - Psi)^2_(i j) <=lambda^2_(k+1)+...+lambda^k_p
$

=== Phương pháp xoay (Rotational method)
Để cải thiện khả năng diễn giải, ta có thể áp dụng ma trận xoay G trực giao: $Q^*=Q G$

Với hai yếu tố, G có thể dược biễu diễn dưới dạng ma trận xoay: $G(theta)=[cos theta sin theta; -sin theta cos theta]$

Phương pháp varimax tìm góc $theta$ tối đa hóa:

$
V=1/p (sum_(l=1)^k [(sum_(j=1)^p (accent(q, "~")_(j ell))^4)- (1/p sum_(j=1)^p (accent(q, "~")_(j ell))^2)^2]
$

Trong đó $accent(q, "~")_(j ell)=accent(q, "~")_(j ell)/accent(h, "~")_j$ là các tải trọng chuẩn hóa.


=== Điểm số yếu tố
Phương pháp hồi quy ước tính điểm số yếu tố cho mỗi quan sất: $accent(f, "^")_i=accent(Q, "^")' S^(-1)(x_i-accent(x, "-"))$

Đối với các biến chuẩn hóa: $accent(f, "^")=accent(Q, "^")'R^(-1) z_i$

Trong đó $z_i=D_S^(1/2)(x_i-accent(x, "-"))$ là các quan sát chuẩn hóa. Nếu các yếu tố được xoay, điểm số sẽ được xoay tương ứng: $accent(f, "^")_i=G accent(f,"^")_i)$

=== Kiểm định dữ liệu
*Phương pháp kiểm định Kaiser-Meyer-Olkin* đo lường mức độ tương quan giữa các biến quan sát. Có công thức:
$
K M O = (Sigma Sigma r^2_(j j))/(Sigma Sigma r^2_(j j)+Sigma Sigma p^2_(i j))
$
Trong đó:
- Ma trận tương quan: r = Corr(X, X)
- Ma trận nghịch đảo tương quan: $a=r^(-1)$
- Ma trận tương quan toàn phần: $p_(i j)=-(a_(i j)) / sqrt(a_(i i) a_(j j))$
Mục đích: Kiểm định để xem nếu dữ liệu phù hợp để phân tích yếu tô bằng cách đo tỷ lệ phương sai giữa các biến, có thể là phương sai chung.

Đánh giá: Chỉ số KMO nằm trong khoảng (0, 1):

- Trên 0.9: Rất tốt
- 0.80 - 0.89: Tốt
- 0.70 - 0.79: Khá 
- 0.60 - 0.69: Trung bình
- 0.50 - 0.59: Kém
- Dưới 0.50: Không thể phân tích yếu tố

= KIỂM ĐỊNH GIẢ THUYẾT (Hypothesis testing)
== Giới thiệu
Kiểm định giả thuyết là một phương pháp được sử dụng để đưa ra quyết định hoặc suy luận về một tham số quần thể dựa trên dữ liệu mẫu. Nó bao gồm việc xây dựng hai giả thuyết cạnh tranh:
- Giả thuyết không (Null) $(H_0)$: Biểu thị giả định hoặc vị trí mặc định, thường không đề xuất hiệu ứng hoặc một điều kiện cụ thể như $theta=theta_0$
- Giả thuyết thay thế $(H_1)$: Đại diện cho một tuyên bố hoặc điều kiện cạnh tranh khi $H_0$ sai.
Mục tiêu của kiểm định giả thuyết là xác định liệu có đủ bằng chứng trong dữ liệu mẫu để bác bỏ $H_0$ và chấp nhận $𝐻_1$.Một khía cạnh quan trọng của quy trình này là kiểm soát lỗi loại I (xác suất bác bỏ $𝐻_0$ khi nó đúng), được ký hiệu là $alpha$
== Phát biểu bài toán
_Đầu vào_:
- Giả thuyết không ($H_0$): Phát biểu rằng tham số $theta$ phụ thuộc vào tập con 0 của không gian tham số $R_q$ (tập hợp giả thuyết không)
- Giả thuyết thay thế ($H_1$): Phát biểu rằng tham số $theta$ thuộc vào tập hợp khác (1).
- Dữ liệu mẫu: Một tập hợp các quan sát mẫu được sử dụng để đánh giá giả thuyết.
- Mức ý nghĩa ($alpha$): Xác suất chấp nhận rủi ro sai lầm Loại I (bác bỏ $H_0$ khi $H_0$ đúng).
_Đầu ra_:
- Kết quả kiểm định: Quyết định bác bỏ $𝐻_0$ (nếu đủ bằng chứng) hoặc chấp nhận $𝐻_0$ (nếu không đủ bằng chứng).
- Vùng bác bỏ (Rejection Region): Tập hợp các giá trị của dữ liệu mẫu dẫn đến bác bỏ $H_0$
- Giá trị thống kê kiểm định: Một chỉ số định lượng dùng để so sánh với ngưỡng được xác định bởi $alpha$
== Phương pháp
=== Kiểm định tỷ lệ khả năng (Likelihood Ratio Test-LRT)
Một phương pháp thống kê phổ biến, dựa trên nguyên lý tỷ lệ khả năng. So sánh khả năng xảy ra của dữ liệu dưới giả thuyết không ($H_0$) với giả thuyết thay thế ($H_1$) thông qua thống kê tỷ lệ khả năng:
$
lambda(X)=(sup_(theta in Theta_0)L(X;theta))/(sup_(theta in Theta_1)L(X;theta))
$
Trong đó $L(X;theta)$ là hàm khả năng; sup là giá trị lớn nhất trong khả năng dưới mỗi giả thuyết.

*Thống kê kiểm định:* Sử dụng log của tỷ lệ khả năng:
$
-2 log lambda(X) = 2(ell^*_1-ell^*_0)
$
Với $ell^*_0$ là log của tỷ lệ khả năng tối đa dưới $H_0$, $ell^*_1$ là log của tỷ lệ khả năng tối đa dưới $H_1$

*Vùng bác bỏ*: Giả thuyết $H_0$ bị bác bỏ nếu:
$
-2log lambda(X)>chi^2_(1-alpha;q-r)
$
Trong đó:
- $q$ là số chiều không gian tham số 1
- $r$ là số chiều không gian tham số 0
- $chi^2$ là phân phối chi bình phương

*Định lý Wilks*:
Với các kích thước mẫu lớn ($n->infinity$), dưới các điều kiện thường quy:
$
-2log lambda (X) ~ chi^2_(q-r)
$

*Ứng dụng kiểm định*:
Khi kiểm định giá trị trung bình của phân phối chuẩn đa biến $N_p (mu, Sigma)$
- Nếu $Sigma$ đã biết:
$
-2 log lambda = n(accent(X, "^")-mu_0)' Sigma^(-1) (accent(X, "^")-mu_0) ~ chi^2_p
$
- Nếu $Sigma$ chưa biết:
$
(n-1)(accent(X, "^")-mu_0)'Sigma^-1(accent(X,"^")-mu_0)~T^2(p, n-1)
$
=== Kiểm định giả thuyết tuyến tính
Cách tiếp cận tổng quát để kiểm tra các ràng buộc tuyến tính trên trung bình vector (
$mu$ ) hoặc hệ số hồi quy (
$beta$) của một mô hình tuyến tính. Phương pháp này được sử dụng phổ biến trong các bài toán kiểm định thực tế về trung bình và hệ số hồi quy.

*Dạng của giả thuyết tuyến tính*: Giả thuyết tuyến tính thường được biểu diễn dưới dạng: 
$
H_0: A_mu = a
$
Với: A là ma trận có kích thước $q * p$; a là vector có kích thước $q * 1$; và $q<=p$

*Các trường hợp kiểm định*:
- Trường hợp 1: Ma trận hiệp phương sai ($Sigma$) đã biết.
Dưới $H_0$, thống kê kiểm định:
$
n(A accent(X, "^")-a)'(A Sigma A')^-1 (A accent(X, "^")-a) ~ chi^2_q
$
- Trường hợp 2: Ma trận hiệp phương sai $Sigma$ chưa biết:
$
(n-1)(A accent(X, "^")-a)'(A Sigma A')^-1 (A accent(X, "^")-a) ~ T^2(q, n-1)
$

=== Tập dữ liệu Boston Housing
*Phân nhóm*

Dữ liệu được chia thành hai nhóm:
- Nhóm 1: 256 quận có giá nhà $X_14$ nhỏ hơn hoặc bằng giá trị trung vị
- Nhóm 2: 250 quận có giá nhà $X_14$ lớn hơn giá trị trung vị.

*Kiểm định trung bình vector*:
- Kiểm định giả thuyết: $H_0: mu_1=mu_2$ vói $mu_1, mu_2 in R^5$.
- Sử dụng biến $X_1, X_5, X_8, X_11, X_13$. Giá trị thống kê F=126.30 lớn hơn ngưỡng $F_(0.95;5,500)=2.23$, do đó bác bỏ $H_0$.
- Các khoảng tin cậy đồng thời cho $delta_j=mu_(1,j)-mu_(2,j)$ chỉ ra rằng các $mu_j$ đều khác không.

*Kiểm tra yếu tố giáp sông (biến $X_4$):*
- Sử dụng các biến $X_5, X_8, X_9, X_12, X_13, X_14$.
- Nhóm 1: 35 quận giáp sông; Nhóm 2: 471 quận không giáp sông.
- Giá trị $F=5.81$, vượt ngưỡng $F_(0.95;6,499)=2.12$, bác bỏ $H_0$.
- Tuy nhiên, chỉ biến $X_14$ (giá nhà) có khoản tin cậy không chứa 0: $delta_14 in(0.0014, 0.5084)$

*Kiểm định mô hình hồi quy tuyến tính*:
- Kiểm định tổng quát: $H_0: (beta_1,..., beta_13)=0$
Giá trị F=123.20
- Kiểm tra riêng biệt: $H_0:beta_4=0$ (ảnh hưởng của yếu tố giáp sông). Giá trị $F=9.0125$, bác bỏ $H_0$.
- Mô hình rút gọn: $X_14$ phụ thuộc vào $X_4, X_5, X_6, X_8,..., X_13$. Mô hình rút gọn $R^2=0.763$, gần với $R^2=0.765$ của mô hình đầy đủ. 