import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Like { like, meh, dislike }

class LikeOrNot extends StatefulWidget {
  Like startingOpinion;
  _Selector like = _Selector();
  _Selector dislike = _Selector();
  LikeOrNot({Key? key, this.startingOpinion = Like.meh}) : super(key: key) {
    if (startingOpinion == Like.meh) {
      like.isSelected = false;
      dislike.isSelected = false;
    } else if (startingOpinion == Like.like) {
      like.isSelected = true;
      dislike.isSelected = false;
    } else {
      like.isSelected = false;
      dislike.isSelected = true;
    }
  }
  Like get opinion {
    if (like.isSelected) {
      return Like.like;
    } else if (dislike.isSelected) {
      return Like.dislike;
    } else {
      return Like.meh;
    }
  }

  bool? get isLiked {
    if (like.isSelected) {
      return true;
    } else if (dislike.isSelected) {
      return false;
    } else {
      return null;
    }
  }

  void clear() => {like.isSelected = false, dislike.isSelected = false};

  @override
  _LikeOrNot createState() => _LikeOrNot();
}

class _LikeOrNot extends State<LikeOrNot> {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Are you enjoying this app?',
            style:
                Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16),
          ),
          SizedBox(
              height: 48,
              width: 48,
              child: IconButton(
                icon: _likeIcon,
                iconSize: 40,
                padding: const EdgeInsets.all(8.0),
                onPressed: () => setState(() {
                  if (widget.dislike.isSelected && !widget.like.isSelected) {
                    widget.dislike.isSelected = !widget.dislike.isSelected;
                  }
                  widget.like.isSelected = !widget.like.isSelected;
                }),
              )),
          SizedBox(
              height: 48,
              width: 48,
              child: IconButton(
                icon: _dislikeIcon,
                iconSize: 40,
                padding: const EdgeInsets.all(8.0),
                onPressed: () => setState(() {
                  if (widget.like.isSelected && !widget.dislike.isSelected) {
                    widget.like.isSelected = !widget.like.isSelected;
                  }
                  widget.dislike.isSelected = !widget.dislike.isSelected;
                }),
              )),
        ],
      );

  get _likeIcon => widget.like.isSelected
      ? Platform.isIOS
          ? Icon(CupertinoIcons.hand_thumbsup_fill,
              color: Theme.of(context).primaryColorDark)
          : Icon(Icons.thumb_up, color: Theme.of(context).primaryColorDark)
      : Platform.isIOS
          ? Icon(CupertinoIcons.hand_thumbsup,
              color: Theme.of(context).primaryColorLight)
          : Icon(Icons.thumb_up_outlined,
              color: Theme.of(context).primaryColorLight);

  get _dislikeIcon => widget.dislike.isSelected
      ? Platform.isIOS
          ? Icon(CupertinoIcons.hand_thumbsdown_fill,
              color: Theme.of(context).primaryColorDark)
          : Icon(Icons.thumb_down, color: Theme.of(context).primaryColorDark)
      : Platform.isIOS
          ? Icon(CupertinoIcons.hand_thumbsdown,
              color: Theme.of(context).primaryColorLight)
          : Icon(Icons.thumb_down_outlined,
              color: Theme.of(context).primaryColorLight);
}

class _Selector {
  _Selector();
  bool isSelected = false;
}
