# Import library
library(dplyr)
library(nycflights13)

# Data penerbangan amerika tahun 2013
data <- flights

# Summary/ringkasan data
summary(data)

# Mengubah rownames menjadi sebuah kolom baru
data <- cbind(number = rownames(data),data)

# Memfilter data menggunakan filter()
new <- filter(data, day==28, month==2, dest=='IND')

test <- filter(data,day==28, month==2, dep_time<=2000)

# Memfilter data secara manual
test2 <- data[data$day==28 & data$month==2 & data$dep_time<=2000,]

# Memfilter data secara manual & menghilangkan data N/A
test3 <- na.omit(data[data$day==28 & data$month==2 & data$dep_time<=2000,])

# Jumlah data pada test & test 3 memiliki selisih 1 data
# Mencari data ke berapa yang berbeda
for(i in 1:nrow(test3)){
  count =0
  if (test$number[i] != test3$number[i]){
    print(test$number[i])
    count=count+1
    break
  }
}
# Data test memiliki 1 data lebih banyak dibanding data test3 karena ada data NA
# Membuat data test dengan filter na dengan nama test4
test4 <- na.omit(filter(data,day==28, month==2, dep_time<=2000))

# Penggunaan slice() untuk slicing data
cut <- slice(data, 2:10)

# Penggunaan arrange() untuk mengurutkan berdasarkan kolom
data2 <- data
data2 <- arrange(data2, year, month, flight)

# Memilih kolom tertentu dengan select()
select <- select(data, number, origin, dest)

# Mengubah nama kolom menggunakan rename()
change <- rename(data, index = number)

# Memilih isi data yang unik dengan distinct()
unique <- distinct(select(data, carrier))

# Menambah kolom baru menggunakan mutate()
addition <- mutate(data, new_col= arr_delay + dep_delay)
addition <- select(addition, number, new_col, arr_delay, dep_delay)

# Menambah kolom baru seperti mutate tapi tidak menampilkan kolom lain dengan transmute()
transmute <- transmute (data, new_col = arr_delay + dep_delay)

# Meringkas kolom dengan summarise()
summarise(data, avg_air_time = mean(air_time, na.rm=TRUE))
summarise(data, sum_air_time = sum(air_time, na.rm=TRUE))

# Melakukan Sampling dari data secara random dengan sample_n() atau sample_frac()
# sample_n() menggunakan jumlah data, sample_frac() menggunakan persentase data
sample_n(data,20)
sample <- sample_frac(data,0.1)
