import 'package:flutter/material.dart';
import 'package:portfolio_stefun_1/extensions.dart';
import 'package:portfolio_stefun_1/main.dart';
import 'package:portfolio_stefun_1/viewmodels/project_viewmodel.dart';
import 'package:portfolio_stefun_1/widgets/common_widgets.dart';

import '../blocs/project_part/projec_bloc_imports.dart';
import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(builder: (context, state) {
      if (state is ProjectLoading) {
        return Container(
          color: Colors.black.withOpacity(0.1),
          width: Sizes.width,
          height: Sizes.height / 2,
          child: const ShowShimmer(widget: SizedBox()),
        );
      }
      if (state is ProjectError) {
        return Container(
            color: Colors.black.withOpacity(0.1),
            width: Sizes.width,
            height: Sizes.height / 2,
            alignment: Alignment.center,
            child: const Text("Something Went Wrong !"));
      }
      if (state is ProjectLoaded) {
        return Column(
            children: state.projects.map((e) {
          Project project = e;
          return LayoutBuilder(builder: (context, c) {
            if (c.maxWidth < 900) {
              return Card(
                  color: Colors.white.withOpacity(0.1),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          project.title,
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(height: 20),
                        FutureBuilder<String?>(
                            future: ProjectViewModel.downloadURLExample(
                                fileName: "${project.title}.jpeg"),
                            builder: (context, ds) {
                              return Container(
                                width: Sizes.height / 3.5,
                                height: Sizes.height / 3.5,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25)),
                                    image: ds.connectionState ==
                                            ConnectionState.waiting
                                        ? null
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(ds.data!),
                                            scale: 1)),
                                child: ds.connectionState ==
                                        ConnectionState.waiting
                                    ? const CircularProgressIndicator()
                                    : const SizedBox(),
                              );
                            }),
                        const SizedBox(height: 30),
                        Column(
                            children: project.description
                                .map(
                                  (e) => SizedBox(
                                    width: Sizes.width / 1,
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.arrow_circle_right_outlined,
                                        color: Colors.lightGreen,
                                      ),
                                      title: Text(
                                        e,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                                .toList())
                      ],
                    ),
                  ));
            }
            return InkWell(
              onTap: () async {
                if (project.appUrl != null) {
                  await project.appUrl!.toUri().launch();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      "Currently ${project.title} is Unavailable in Playstore !"
                          .toSnack());
                }
              },
              child: Card(
                  color: Colors.white.withOpacity(0.1),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Sizes.height / 2,
                        height: Sizes.height / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder<String?>(
                                future: ProjectViewModel.downloadURLExample(
                                    fileName: "${project.title}.jpeg"),
                                builder: (context, ds) {
                                  return Container(
                                    width: Sizes.height / 3.5,
                                    height: Sizes.height / 3.5,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                        image: ds.connectionState ==
                                                ConnectionState.waiting
                                            ? null
                                            : DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(ds.data!),
                                                scale: 1)),
                                    child: ds.connectionState ==
                                            ConnectionState.waiting
                                        ? const CircularProgressIndicator()
                                        : const SizedBox(),
                                  );
                                }),
                            const SizedBox(height: 30),
                            Text(
                              project.title,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      Column(
                          children: project.description
                              .map(
                                (e) => SizedBox(
                                  width: Sizes.width / 1.7,
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: Colors.lightGreen,
                                    ),
                                    title: Text(
                                      e,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                              .toList())
                    ],
                  )),
            );
          });
        }).toList());
      }

      return Container();
    });
  }
}
