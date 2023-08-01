import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Draggable<Task>(
      data: task,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: Text(
        task.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0.w),
        margin: EdgeInsets.only(bottom: 10.0.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            ..._buildCardInfo(context),
            _buildCardAdditionalInfo(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCardInfo(BuildContext context) {
    return [
      SizedBox(height: 10.h),
      Text(
        task.title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 5.h),
      Text(
        task.description,
        maxLines: 2,
      ),
      SizedBox(height: 10.h),
    ];
  }

  Widget _buildCardAdditionalInfo() {
    return (task.commentCount > 0 || task.attachmentCount > 0)
        ? Container(
            margin: EdgeInsets.only(top: 10.0.h),
            child: Row(
              children: [
                (task.commentCount > 0)
                    ? Row(
                        children: [
                          Text('${task.commentCount}'),
                          const SizedBox(width: 5),
                          const Icon(Icons.comment),
                        ],
                      )
                    : const SizedBox(),
                SizedBox(width: 10.w),
                (task.attachmentCount > 0)
                    ? Row(
                        children: [
                          Text('${task.attachmentCount}'),
                          const SizedBox(width: 5),
                          const Icon(Icons.link)
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget _buildImage() {
    return (task.image == null)
        ? const SizedBox()
        : ClipRRect(
            borderRadius: BorderRadius.circular(10.0.sp),
            child: Image(
              image: task.image!,
              width: double.infinity,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          );
  }
}
