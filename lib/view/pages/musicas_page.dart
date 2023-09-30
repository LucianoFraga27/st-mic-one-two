import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/card_music.dart';
import 'package:mic_check_one_two/view/widgets/destaque_widget.dart';

class MusicasPage extends StatefulWidget {
  @override
  _MusicasPageState createState() => _MusicasPageState();
}

class _MusicasPageState extends State<MusicasPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                child: Text(
                  'Seguindo',
                  style: TextStyle(
                    fontSize: 18,
                    color: _currentPage == 0 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                child: Text(
                  'Para Você',
                  style: TextStyle(
                    fontSize: 18,
                    color: _currentPage == 1 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              SingleChildScrollView(child: _seguindo()),
              SingleChildScrollView(child: _paravoce()),
            ],
          ),
        ),
      ],
    );
  }

  _paravoce() {
    return Column(
      children: [
        const SizedBox(height: 20),
        ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10, // O número de cartões de música que você deseja criar
          itemBuilder: (context, index) {
            return CardMusica();
          },
        ),
      ],
    );
  }

  Column _seguindo() {
    return Column(
      children: [
        const SizedBox(height: 20),
        ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10, // O número de cartões de música que você deseja criar
          itemBuilder: (context, index) {
            return CardMusica();
          },
        ),
      ],
    );
  }
}
