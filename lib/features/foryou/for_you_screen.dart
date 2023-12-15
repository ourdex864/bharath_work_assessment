import 'package:bharath_work_assessment/common/ui/timer_widget.dart';
import 'package:bharath_work_assessment/features/foryou/bloc/for_you_bloc.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_question_model_entity.dart';
import 'package:bharath_work_assessment/features/foryou/option_item.dart';
import 'package:bharath_work_assessment/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_background_text/rounded_background_text.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  @override
  void initState() {
    context.read<ForYouBloc>().add(FetchQuestionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForYouBloc, ForYouState>(
      builder: (context, state) {
        return Container(
          decoration: state.question?.image != null
              ? BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(state.question?.image ?? ""),
                      fit: BoxFit.cover))
              : null,
          child: SafeArea(
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      _topBar(),
                      Expanded(
                          child: Row(
                        children: [
                          Flexible(
                              flex: 88,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        _questionWidget(state),
                                        const Spacer(),
                                        _options(state),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          Flexible(
                            flex: 12,
                            child: _actionBarWidget(state),
                          )
                        ],
                      )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: _contentAuthorWidget(state)),
                      _playlistWidget(state),
                    ],
                  ),
                  if (state.isLoading == true) ...[
                    const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _timerWidget(),
          const Spacer(),
          _titleWidget(),
          const Spacer(),
          _searchButton()
        ],
      ),
    );
  }

  Widget _timerWidget() {
    return TimerWidget(
      initialSeconds: 60,
      icon: Icons.alarm,
      text: "",
      onFinished: _onFinished,
    );
  }

  Widget _titleWidget() {
    return Column(
      children: [
        const Text(
          "For You",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          color: Colors.white,
          height: 5,
          width: 30,
        )
      ],
    );
  }

  Widget _searchButton() {
    return IconButton(
        onPressed: () => {}, icon: const Icon(Icons.search, color: Colors.white));
  }

  void _onFinished() {
    debugPrint("On Finished");
    // TODO: On Timer finish, disable the selection
    // context.read<ForYouBloc>().add(FetchQuestionEvent());
    // setState(() {});
  }

  Widget _questionWidget(ForYouState state) {
    if (state.question != null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            RoundedBackgroundText(
              state.question!.question ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.white,
              ),
              backgroundColor: Colors.black.withOpacity(0.7),
              outerRadius: 8,
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  Widget _options(ForYouState state) {
    final validAnswer = state.validAnswer;
    final selectedAnswer = state.selectedAnswer;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = state.question?.options?[index];
            return GestureDetector(
              child: OptionItemWidget(
                itemAnswer: item?.id ?? "",
                correctAnswer: validAnswer,
                selectedAnswer: selectedAnswer,
                option: item?.answer ?? "",
              ),
              onTap: () => _onOptionSelected(state.question, item),
            );
          },
          itemCount: state.question?.options?.length ?? 0,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }

  void _onOptionSelected(MCQuestionModelEntity? question, MCQuestionModelOptions? item) {
    if (item != null && question != null) {
      context
          .read<ForYouBloc>()
          .add(ValidateAnswerEvent(questionModelEntity: question, selectedOption: item));
    }
  }

  Widget _contentAuthorWidget(ForYouState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.question?.user?.name ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            "5.4 The Compromise of 1850 #apush5_1",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget _playlistWidget(ForYouState state) {
    return Container(
      color: const Color(0xff161616),
      constraints: const BoxConstraints(minHeight: 40),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.local_play_sharp,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Playlist • ${state.question?.playlist ?? ""}",
              style: const TextStyle(
                  color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _actionBarWidget(ForYouState state) {
    return Column(
      children: [
        const Spacer(),
        _createItem(state.question?.user?.avatar),
        _favorite(),
        _chat(),
        _save(),
        _forward()
      ],
    );
  }

  Widget _createItem([String? avatar]) {
    return GestureDetector(
        onTap: () => {},
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Stack(
            children: [
              avatar != null
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Image.network(
                          avatar,
                          width: 36,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                bottom: 0,
                left: 2,
                right: 0,
                child: SvgPicture.asset(Assets.icons.add),
              )
            ],
          ),
        ));
  }

  Widget _favorite() {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset(
                Assets.icons.heart,
                width: 25,
                height: 25,
              )),
          const Text(
            "87",
            style:
                TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _chat() {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset(
                Assets.icons.comments,
                width: 25,
                height: 25,
              )),
          const Text(
            "2",
            style:
                TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _save() {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset(
                Assets.icons.save,
                width: 25,
                height: 25,
              )),
          const Text(
            "203",
            style:
                TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _forward() {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset(
                Assets.icons.forward,
                width: 25,
                height: 25,
              )),
          const Text(
            "17",
            style:
                TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
