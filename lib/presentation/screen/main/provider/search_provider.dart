import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
    final List<String> _imageList = [
        'https://www.redcross.org.uk/-/media/feature/projectred/16x9/events/walk-for-humanity/walk-humanity-walkers-three-1084x610.jpg?sc_lang=en&mh=610&la=en&h=610&w=1084&mw=1084&hash=4E05883FAB0C466207952F0B016BADB3',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXaDWs2kZ_ZgBXJZGYuvAhUNOmgXksQDZviw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLq9m-k0pDTtwqEk6-jLP0ba2R4jfyy3DWQw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzEXQ3J57OKY1VMmjzXoY84u5dtlIexvnpUTMzpCcn7LyOQMHkCQN871_WU5TzLT-TAGQ&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1jcImrxHxsIl7xOwCGKRA_R8vR7OkRBlyFTxHgIOzhMKIqCaR6gm95X5n8scjfRAsK8Y&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4684QsDpah4E6PTKwcQuK_aecgxgJHF4Ygw&s',
        'https://image.idntimes.com/post/20231217/4beb972c-bddb-40df-bdef-6e614456f640-58104fcf873a91b060fa273c628f6d83-1f8c9c4e6649c7b0c18f2e22671ad35f.jpeg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ50e1f0oGQWz7ULd9urGg17vh-QyNWeyWI8Q&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPk-LGptRxmvvp1hqrT6lucbUJml-ksI5Ja6SjnkRc6XhBb2kSgPuHhcKermmKOICfWAM&usqp=CAU',
        'https://www.jewishvoiceforpeace.org/wp-content/uploads/2023/04/jews-for-palestine.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvwflWmXR8GTtPGIp1aFklT95nzstK2hZEAJAfjp3GAj4xZwQlcKm7GIPgStiinHhSw08&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjZFVfzehDBMa-g2nn3MtuOrSXMHGLcFdrtZnTYTIklNX-L3PWmZOB9DGl_FtN8RAhp0Y&usqp=CAU',
        'https://nationaltoday.com/wp-content/uploads/2022/06/World-Humanitarian-Action-Day-1200x834.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpJvCZJJzApvTDfrtf5so0M4iZVMyIfgTNpA&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREKVW3Re9tD5YUBb6rvyImFfK6FfBXVvkXbA&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkWZ5_PiSlMSXP7prXv_t6cDdCymg6Hz9o3i-Qx4aimepStXCZp7Zg3s-RQ0dq7H8iJUg&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJQVQKh4jfK2wBWKo3CyOv15ydsBO9cRP3jdrUBQkNamcz3O_fp5kRh-Kub0WmpVNLGZo&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEdvNFKQnM-mFnHT9VPKra22_27WuGLsU2Rw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtYTti4IMrqgwJ59IreucZYKQUQLoJGaUbjesSjyIoDwLF4wU068Lxy7r19kXfDZb1XY0&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq9GL5Hegmni9U17EQwFL9ZHd_9KOn7MWUmw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZfT11LWw4fn1PvS9ZZjVVGac4oHlh7rLVog&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEqUlMzkhMpRXvvOjT7PINYaLn2CzHXclq9g&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxXasqqDB3LFNHMOSf7N3Pei28Fs55VL1asReYLITm7whO7aRsfQvEQgFDavOlNL1gXew&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_oxjhOh7G8v0Ij97x2d_U2erRawkkpyzqzvilLm_rOM_eVI0SuaUQQL6etnf4Q1MWhdE&usqp=CAU'
    ];

    List<String> get imageList => _imageList;
}