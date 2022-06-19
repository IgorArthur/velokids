import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:velokids/controller/main_controller.dart';
import 'package:velokids/view/utils/export_utils.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.neutral0,
          toolbarHeight: 6.7.h,
          title: const Text('VELOKIDS').button(AppColors.neutral200),
          centerTitle: true,
          leading: TextButton(
            child: Icon(
              Icons.arrow_back,
              color: AppColors.neutral200,
              size: 5.8.w,
            ),
            onPressed: () => _backAlert(context),
          ),
        ),
        backgroundColor: AppColors.neutral0,
        body: _handleBody(context),
      ),
    );
  }

  Widget _handleBody(BuildContext context) {
    final now = DateTime.now();

    return GetBuilder<MainController>(
        init: MainController(),
        builder: (mainController) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 2.h),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    width: 80.w,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 30.w,
                          child: Text(mainController.selectedService.vehicle)
                              .large(AppColors.primary100),
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 30.w,
                          child: Text('${now.day}/${now.month}/${now.year}')
                              .button(AppColors.neutral200),
                        ),
                      ],
                    ),
                  ),
                  InfoTile(
                    title: 'CLIENTE',
                    hint: 'Nome do cliente',
                    info: mainController.clientNameField,
                  ),
                  InfoTile(
                    title: 'CPF',
                    hint: '000.000.000-00',
                    info: mainController.clientDocumentField,
                    mask: [
                      MaskTextInputFormatter(
                        mask: '###.###.###-##',
                        filter: {'#': RegExp('[0-9]')},
                      )
                    ],
                  ),
                  InfoTile(
                    title: 'LOCAÇÃO',
                    hint: '00:00 - 00:00',
                    info: mainController.rentField,
                    mask: [
                      MaskTextInputFormatter(
                        mask: '##:## - ##:##',
                        filter: {'#': RegExp('[0-9]')},
                      )
                    ],
                  ),
                  InfoTile(
                    title: 'VALOR',
                    hint: 'R\$ 00,00',
                    info: mainController.valueField,
                    mask: [
                      MaskTextInputFormatter(
                        mask: 'R\$ ##,##',
                        filter: {'#': RegExp('[0-9]')},
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                  ),
                  CommonButton(
                    type: 2,
                    title: 'CANCELAR SERVIÇO',
                    icon: Icons.close,
                    iconColor: AppColors.error100,
                    iconSize: 5.7.w,
                    onPressed: () {
                      _cancelAlert(context, mainController);
                    },
                  ),
                  CommonButton(
                    type: 1,
                    title: 'EMITIR NOTA FISCAL',
                    icon: Icons.download,
                    iconColor: AppColors.neutral0,
                    iconSize: 5.7.w,
                    onPressed: () {
                      _receiptAlert(context, mainController);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _backAlert(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('AVISO!').large()),
          content: SizedBox(
            height: 8.h,
            child: Center(
              child: const Text(
                'Deseja voltar? O serviço não será salvo.',
                textAlign: TextAlign.center,
              ).medium(),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.neutral0,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.error100)),
                width: 25.w,
                height: 4.5.h,
                child: const Text('Não').button(AppColors.error100),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 25.w,
                height: 4.5.h,
                child: const Text('Sim').button(AppColors.neutral0),
              ),
            ),
          ],
        );
      },
    );
  }

  void _cancelAlert(
    BuildContext context,
    MainController mainController,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('AVISO!').large()),
          content: SizedBox(
            height: 8.h,
            child: Center(
              child: const Text(
                'Deseja cancelar? O serviço não entrará no histórico.',
                textAlign: TextAlign.center,
              ).medium(),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.neutral0,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.error100)),
                width: 25.w,
                height: 4.5.h,
                child: const Text('Não').button(AppColors.error100),
              ),
            ),
            TextButton(
              onPressed: () {
                mainController.deleteService();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 25.w,
                height: 4.5.h,
                child: const Text('Sim').button(AppColors.neutral0),
              ),
            ),
          ],
        );
      },
    );
  }

  void _receiptAlert(
    BuildContext context,
    MainController mainController,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('AVISO!').large()),
          content: SizedBox(
            height: 8.h,
            child: Center(
              child: const Text(
                'Deseja gerar nota fiscal? O serviço entrará no histórico.',
                textAlign: TextAlign.center,
              ).medium(),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.neutral0,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.error100)),
                width: 25.w,
                height: 4.5.h,
                child: const Text('Não').button(AppColors.error100),
              ),
            ),
            TextButton(
              onPressed: () {
                mainController.generateReceiptService();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 25.w,
                height: 4.5.h,
                child: const Text('Sim').button(AppColors.neutral0),
              ),
            ),
          ],
        );
      },
    );
  }
}
