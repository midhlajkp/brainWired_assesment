import 'package:brainwired_assesment/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../model/companyModel.dart';
import '../res/images.dart';
import '../res/style.dart';
import 'launchFunctions.dart';

class CompanyInfoCard extends StatefulWidget {
  final CompanyModel companyModel;
  final int index;
  final List<bool> isPressed;

  const CompanyInfoCard({
    Key? key,
    required this.companyModel,
    required this.isPressed,
    required this.index,
  }) : super(key: key);

  @override
  State<CompanyInfoCard> createState() => _CompanyInfoCardState();
}

class _CompanyInfoCardState extends State<CompanyInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.companyModel.company.name,
                style: openSansFont(
                  size: size20,
                  color: Colors.blue,
                  fontWeight: fontWeightSemiBold,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(widget.companyModel.company.bs),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Icon(
                  Icons.info_outline_rounded,
                  size: 15,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Center(
            child: Text(
              '"${widget.companyModel.company.catchPhrase}"',
              style: openSansFont(
                size: size14,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.companyModel.proprietorName,
                style: openSansFont(
                  size: size14,
                  color: Colors.green,
                  fontWeight: fontWeightRegular,
                ),
              ),
              InkWell(
                onTap: () {
                  Share.share(widget.companyModel.username);
                },
                child: Text(
                  "@${widget.companyModel.username}",
                  style: openSansFont(
                    size: size14,
                    color: Colors.deepOrange,
                    fontWeight: fontWeightRegular,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        if (widget.isPressed[widget.index]) {
                          widget.isPressed[widget.index] = false;
                        } else {
                          widget.isPressed[widget.index] = true;
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show more",
                          style: openSansFont(
                              size: size10, color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          widget.isPressed[widget.index]
                              ? Icons.arrow_circle_down_outlined
                              : Icons.arrow_circle_right_outlined,
                          size: 15,
                          color: Colors.grey[600],
                        )
                      ],
                    ))
              ],
            ),
          ),
          if (widget.isPressed[widget.index])
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        addressText,
                        style: openSansFont(
                          size: size14,
                          color: Colors.black87,
                          fontWeight: fontWeightSemiBold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Share.share(
                              "${widget.companyModel.address.street} ${widget.companyModel.address.suite} ${widget.companyModel.address.city} ${widget.companyModel.address.zipcode}");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                widget.companyModel.address.street,
                                style: openSansFont(
                                  size: size14,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                widget.companyModel.address.suite,
                                style: openSansFont(
                                  size: size14,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                widget.companyModel.address.city,
                                style: openSansFont(
                                  size: size14,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                widget.companyModel.address.zipcode,
                                style: openSansFont(
                                  size: size14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            launchPhoneCall(widget.companyModel.phone);
                          },
                          child: SvgPicture.asset(phoneLogo,
                              height: 20, width: 20)),
                      InkWell(
                        onTap: () {
                          launchEmail(widget.companyModel.email);
                        },
                        child: SvgPicture.asset(
                          mailLogo,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launchMap(
                            widget.companyModel.address.geo.lat,
                            widget.companyModel.address.geo.lng,
                          );
                        },
                        child: SvgPicture.asset(
                          mapLogo,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            launchWebsite(widget.companyModel.website);
                          },
                          child: Image.asset(webLogo, height: 20, width: 20)),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
