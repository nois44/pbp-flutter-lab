# Tugas 7 Flutter

## Penjelasan mengenai definisi stateless widget dan stateful widget dan perbedaan dari keduanya.

Stateful widget adalah widget yang mempunyai mutable state. State adalah informasi yang dapat dibaca secara sinkron selama pembuatan widget dan dapat berubah selama masa pakai widget. Stateful widget bisa sangat berguna ketika bagian tertentu dari antarmuka pengguna berubah secara dinamis, seperti komponen yang bergantung pada state sistem. Instance dari stateful widget sendiri adalah immutable atau tidak bisa diubah dan menyimpan state mutable mereka dalam objek state yang terpisah yang dibuat oleh method createState atau di dalam objek yang  menjadi parent dari state tersebut. Stateful widget menyimpan objek state yang sama ketika berpindah dari sebuah lokasi ke lokasi lainnya di dalam tree jika developer menggunakan GlobalKey untuk key-nya.

Stateless widget merupakan widget yang tidak membutuhkan mutable state. Stateless widget memiliki kegunaan ketika ada bagian dari user interface yang tidak bergantung pada hal-hal lain (independet) selain dari konfigurasi dari informasi objeknya sendiri dan BuildContext yang mendefinisikan widget tersebut. Method dari stateless widget normalnya hanya dipanggil saat keadaan tertentu ,yaitu saat pertama kali widget tersebut dimasukkan ke dalam tree, ketika widget parent nya mengubah konfigurasi stateless widget, dan ketika sebuah inheritted widget yang mana bergantung pada stateless widget berubah. 

## Widget yang digunakan Pada Tugas 7 Flutter

- `MaterialApp`: Widget untuk membuat aplikasi material
- `Padding`: Widget untuk memberi spasi di sekitar child widget
- `Row`: Widget untuk menaruh widget children di suatu baris (dari kiri ke kanan)
- `Scaffold`: Widget untuk mengimplementasikan layout Material Design
- `Text`: Widget untuk menaruh teks
- `AppBar`: Widget untuk bar yang ada di atas layar
- `Center`: Widget untuk meletakkan child widget di tengah-tengah parent
- `Column`: Widget untuk menaruh widget children di suatu kolom (dari atas ke bawah)
- `FloatingActionButton`: Widget untuk menampilkan button lingkaran yang melayang

## Fungsi setState()

Fungsi setState() bertugas untuk memberitahu widget bahwa ada objek yang berubah pada State sehingga aplikasi akan memuat ulang widget tersebut dengan nilai yang telah diubah. Pada tugas kali ini setState() berada di dalam fungsi _incrementCounter() yang berfungsi untuk menambahkan nilai dari counter ketika button di tekan dan _decrementCounter() yang berfungsi untuk mengurangi nilai dari counter ketika button di tekan. Cara Kerjanya adalah ketika fungsi setState() dipanggil, framework akan memanggil method build() dari State object yang bersangkutan untuk membangun ulang widget tree yang terkait dengan state tersebut. setState() hanya dapat dipanggil pada State object dan hanya dapat dipanggil ketika State object tersebut sedang dalam state mounted. setState() juga dapat dipanggil ketika State object tersebut sedang dalam state inactive, namun framework tidak akan memanggil method build() dari State object tersebut.

## Const vs Final

"Final" berarti single-assignment: sebuah variabel atau field final harus memiliki nilai yang di-inisiasi. Setelah itu, nilai dari variabel atau field tersebut tidak dapat diubah lagi.

"const" memiliki arti yang sedikit lebih kompleks dan halus di Dart. const memodifikasi nilai. Kita dapat menggunakannya saat membuat list, seperti const [1, 2, 3], dan saat membuat objek (bukan baru) seperti const Point(2, 3). Di sini, const berarti bahwa seluruh keadaan dalam objek dapat diubah seluruhnya pada waktu kompilasi dan bahwa objek akan di-freeze dan sepenuhnya tidak dapat diubah.

## Langkah-langkah Implementasi Flutter Assignment

1. Membuat project baru dengan nama `counter_7` dengan menggunakan command `flutter create counter_7`
2. Membuat fungsi `_incrementCounter()` yang akan menambahkan nilai dari counter ketika button di tekan
3. Membuat fungsi `_decrementCounter()` yang akan mengurangi nilai dari counter ketika button di tekan dengan if else statement jika counter >= 1, makan fungsi tersebut mengurangi nilai counter
4. Menambahkan atribut teks yang menampilkan status ganjil atau genap dari counter, serta menentukan warna teksnya
5. Mengganti atribut `floatingActionButton` pada class `MyHomePage` dengan atribut `floatingActionButton` yang baru yang berisi button untuk menambah dan mengurangi nilai dari counter, serta menentukanjarak button agar sesuai pada image pada tugas.
