import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/button_sheet/help_universo/help_universo_widget.dart';
import '/button_sheet/m_s_g_seu_universo/m_s_g_seu_universo_widget.dart';
import '/button_sheet/select_club/select_club_widget.dart';
import '/button_sheet/select_federation/select_federation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'seu_universo_model.dart';
export 'seu_universo_model.dart';

class SeuUniversoWidget extends StatefulWidget {
  const SeuUniversoWidget({super.key});

  @override
  State<SeuUniversoWidget> createState() => _SeuUniversoWidgetState();
}

class _SeuUniversoWidgetState extends State<SeuUniversoWidget> {
  late SeuUniversoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeuUniversoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SeuUniverso'});
    _model.textFieldNomeController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldNomeFocusNode ??= FocusNode();

    _model.textFielApelidoController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.displayApelido, ''));
    _model.textFielApelidoFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).info,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('SEU_UNIVERSO_arrow_back_rounded_ICN_ON_T');
                logFirebaseEvent('IconButton_alert_dialog');
                await showDialog(
                  barrierColor: const Color(0x40558BF8),
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: const MSGSeuUniversoWidget(),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));

                logFirebaseEvent('IconButton_navigate_back');
                context.safePop();
              },
            ),
          ),
          title: Align(
            alignment: const AlignmentDirectional(-0.05, 0.05),
            child: Text(
              FFLocalizations.of(context).getText(
                'nqxmxj27' /* Altere Seu Universo */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('SEU_UNIVERSO_PAGE_Icon_3vg1kddm_ON_TAP');
                  logFirebaseEvent('Icon_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: const Color(0x3F558BF8),
                    barrierColor: const Color(0x3F558BF8),
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            child: const HelpUniversoWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Icon(
                  Icons.help_outline,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Align(
                  alignment: const AlignmentDirectional(0.1, -0.05),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Imagem_2.jpeg',
                        ).image,
                      ),
                    ),
                    alignment: const AlignmentDirectional(0.0, -0.55),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -0.8),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 90.0,
                                          height: 90.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl: valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 15.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SEU_UNIVERSO_Buttonfotoperfil_ON_TAP');
                                    if (currentUserPhoto != '') {
                                      logFirebaseEvent(
                                          'Buttonfotoperfil_delete_data');
                                      await FirebaseStorage.instance
                                          .refFromURL(currentUserPhoto)
                                          .delete();
                                    }
                                    logFirebaseEvent(
                                        'Buttonfotoperfil_upload_media_to_firebas');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 90.00,
                                      maxHeight: 90.00,
                                      imageQuality: 100,
                                      allowPhoto: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      textColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }

                                    logFirebaseEvent(
                                        'Buttonfotoperfil_backend_call');

                                    await currentUserReference!
                                        .update(createUserRecordData(
                                      photoUrl: _model.uploadedFileUrl,
                                    ));
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'pgyg240t' /* Atualizar Foto */,
                                  ),
                                  icon: Icon(
                                    Icons.picture_in_picture,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 26.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0x0A4B39EF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 9.0,
                                        ),
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 550.0,
                                    constraints: const BoxConstraints(
                                      maxWidth: 550.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: Image.asset(
                                          'assets/images/fundo_transparente.png',
                                        ).image,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          offset: const Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  TextFormField(
                                                controller: _model
                                                    .textFieldNomeController,
                                                focusNode: _model
                                                    .textFieldNomeFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textFieldNomeController',
                                                  const Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'xaif4foc' /* Nome */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '2c0xw3w5' /* Digite seu Nome */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.person_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  suffixIcon: _model
                                                          .textFieldNomeController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .textFieldNomeController
                                                                ?.clear();
                                                            setState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 22.0,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                textAlign: TextAlign.start,
                                                validator: _model
                                                    .textFieldNomeControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 10.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  TextFormField(
                                                controller: _model
                                                    .textFielApelidoController,
                                                focusNode: _model
                                                    .textFielApelidoFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textFielApelidoController',
                                                  const Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'gmwzyavx' /* Apelido */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '9xuq1902' /* Digite seu Apelido */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets.all(10.0),
                                                  prefixIcon: Icon(
                                                    Icons.person,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  suffixIcon: _model
                                                          .textFielApelidoController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .textFielApelidoController
                                                                ?.clear();
                                                            setState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 22.0,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                textAlign: TextAlign.start,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                validator: _model
                                                    .textFielApelidoControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 10.0),
                                            child: Container(
                                              height: 55.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        3.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                              borderRadius:
                                                                  15.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              icon: Icon(
                                                                Icons
                                                                    .date_range_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'SEU_UNIVERSO_date_range_outlined_ICN_ON_');
                                                                logFirebaseEvent(
                                                                    'IconButton_date_time_picker');
                                                                final datePickedDate =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate: (_model
                                                                          .datePicked ??
                                                                      DateTime
                                                                          .now()),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate: (_model
                                                                          .datePicked ??
                                                                      DateTime
                                                                          .now()),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          const Color(
                                                                              0x40558BF8),
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                32.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      selectedDateTimeBackgroundColor:
                                                                          const Color(
                                                                              0x40558BF8),
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (datePickedDate !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked =
                                                                        DateTime(
                                                                      datePickedDate
                                                                          .year,
                                                                      datePickedDate
                                                                          .month,
                                                                      datePickedDate
                                                                          .day,
                                                                    );
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'blyzoe21' /* Data Nasc: */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SEU_UNIVERSO_PAGE_Text_cgsgaiz6_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Text_backend_call');

                                                                  await currentUserReference!
                                                                      .update(
                                                                          createUserRecordData(
                                                                    aniversario:
                                                                        _model
                                                                            .datePicked,
                                                                  ));
                                                                },
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                    'd/M/y',
                                                                    _model
                                                                        .datePicked,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (dateTimeFormat(
                                                                    'yMd',
                                                                    _model
                                                                        .datePicked,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ) ==
                                                                  '')
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Text(
                                                                    dateTimeFormat(
                                                                      'd/M/y',
                                                                      currentUserDocument!
                                                                          .aniversario!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 152.0,
                                              decoration: const BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SEU_UNIVERSO_PAGE_FEDERATION_ON_TAP');
                                                            logFirebaseEvent(
                                                                'FEDERATION_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: const Color(
                                                                  0x3F558BF8),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.9,
                                                                      child:
                                                                          const SelectFederationWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(() =>
                                                                    _model.federationSelected =
                                                                        value));

                                                            if (_model
                                                                        .federationSelected
                                                                        ?.reference
                                                                        .id !=
                                                                    null &&
                                                                _model
                                                                        .federationSelected
                                                                        ?.reference
                                                                        .id !=
                                                                    '') {
                                                              if (currentUserDocument
                                                                          ?.federation
                                                                          ?.id !=
                                                                      null &&
                                                                  currentUserDocument
                                                                          ?.federation
                                                                          ?.id !=
                                                                      '') {
                                                                logFirebaseEvent(
                                                                    'FEDERATION_backend_call');

                                                                await currentUserDocument!
                                                                    .federation!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'usuariosFederation':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        currentUserReference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              }
                                                              logFirebaseEvent(
                                                                  'FEDERATION_backend_call');

                                                              await currentUserReference!
                                                                  .update({
                                                                ...createUserRecordData(
                                                                  federation: _model
                                                                      .federationSelected
                                                                      ?.reference,
                                                                  photoFeder: _model
                                                                      .federationSelected
                                                                      ?.foto,
                                                                  nomeFederer: _model
                                                                      .federationSelected
                                                                      ?.nome,
                                                                  uf: _model
                                                                      .federationSelected
                                                                      ?.uf,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'photo_club':
                                                                        FieldValue
                                                                            .delete(),
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  'FEDERATION_backend_call');

                                                              await _model
                                                                  .federationSelected!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'usuariosFederation':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      currentUserReference
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  'FEDERATION_backend_call');

                                                              await currentUserDocument!
                                                                  .club!
                                                                  .update(
                                                                      createClubeRecordData(
                                                                idFederation:
                                                                    currentUserDocument
                                                                        ?.federation,
                                                              ));
                                                            }

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0x80FFFFFF),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      12.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          5.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          const Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          const Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        valueOrDefault(
                                                                            currentUserDocument?.photoFeder,
                                                                            ''),
                                                                        'https://firebasestorage.googleapis.com/v0/b/universo-botonista-flutterflow.appspot.com/o/users%2FUDe7HPuzHOZJKPMNy3xadXbG22J2%2Fuploads%2F1698868364304000.png?alt=media&token=a989bc43-f0bd-4f17-be68-aafe62f2a4e6',
                                                                      ),
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            Text(
                                                                      valueOrDefault(
                                                                              currentUserDocument?.nomeFederer,
                                                                              '')
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            25,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'SEU_UNIVERSO_PAGE_CLUBE_ON_TAP');
                                                        var shouldSetState =
                                                            false;
                                                        if (!(currentUserDocument
                                                                ?.federation !=
                                                            null)) {
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                          return;
                                                        }
                                                        logFirebaseEvent(
                                                            'CLUBE_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              const Color(0x3F558BF8),
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    SizedBox(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.9,
                                                                  child:
                                                                      const SelectClubWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(() =>
                                                                _model.clubeSelected =
                                                                    value));

                                                        shouldSetState = true;
                                                        if (_model
                                                                    .clubeSelected
                                                                    ?.reference
                                                                    .id !=
                                                                null &&
                                                            _model
                                                                    .clubeSelected
                                                                    ?.reference
                                                                    .id !=
                                                                '') {
                                                          if (currentUserDocument
                                                                      ?.club
                                                                      ?.id !=
                                                                  null &&
                                                              currentUserDocument
                                                                      ?.club
                                                                      ?.id !=
                                                                  '') {
                                                            logFirebaseEvent(
                                                                'CLUBE_backend_call');

                                                            await currentUserDocument!
                                                                .club!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'usuariosClube':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    currentUserReference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                          } else {
                                                            logFirebaseEvent(
                                                                'CLUBE_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  '..',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        200),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            );
                                                          }

                                                          logFirebaseEvent(
                                                              'CLUBE_backend_call');

                                                          await currentUserReference!
                                                              .update(
                                                                  createUserRecordData(
                                                            nomeClub: _model
                                                                .clubeSelected
                                                                ?.nome,
                                                            photoClub: _model
                                                                .clubeSelected
                                                                ?.foto,
                                                            club: _model
                                                                .clubeSelected
                                                                ?.reference,
                                                          ));
                                                          logFirebaseEvent(
                                                              'CLUBE_backend_call');

                                                          await currentUserDocument!
                                                              .federation!
                                                              .update(
                                                                  createFederationsRecordData(
                                                            foto: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.photoFeder,
                                                                ''),
                                                          ));
                                                          logFirebaseEvent(
                                                              'CLUBE_backend_call');

                                                          await _model
                                                              .clubeSelected!
                                                              .reference
                                                              .update({
                                                            ...createClubeRecordData(
                                                              idFederation:
                                                                  currentUserDocument
                                                                      ?.federation,
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'usuariosClube':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                          logFirebaseEvent(
                                                              'CLUBE_backend_call');

                                                          await currentUserDocument!
                                                              .club!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'usuariosClube':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                          logFirebaseEvent(
                                                              'CLUBE_backend_call');

                                                          await _model
                                                              .clubeSelected!
                                                              .idFederation!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'Id_Clube':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserDocument
                                                                      ?.club
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                        if (shouldSetState) {
                                                          setState(() {});
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0x80FFFFFF),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 12.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 5.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.photoClub,
                                                                        ''),
                                                                    'https://firebasestorage.googleapis.com/v0/b/universo-botonista-flutterflow.appspot.com/o/users%2FUDe7HPuzHOZJKPMNy3xadXbG22J2%2Fuploads%2F1698868395467000.png?alt=media&token=d6f23841-0aa8-4a24-900b-dd33e89557ac',
                                                                  ),
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        Text(
                                                                  valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.nomeClub,
                                                                          '')
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        25,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontSize:
                                                                            10.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<ModalidadesRecord>>(
                                              stream: queryModalidadesRecord(
                                                queryBuilder:
                                                    (modalidadesRecord) =>
                                                        modalidadesRecord
                                                            .orderBy('Seq'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 10.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ModalidadesRecord>
                                                    rowModalidadesRecordList =
                                                    snapshot.data!;
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        rowModalidadesRecordList
                                                            .length,
                                                        (rowIndex) {
                                                      final rowModalidadesRecord =
                                                          rowModalidadesRecordList[
                                                              rowIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SEU_UNIVERSO_PAGE_Image_wxh5gn62_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Image_backend_call');

                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'MinhasModalidades': FieldValue.arrayUnion([
                                                                                rowModalidadesRecord.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        if (!rowModalidadesRecord
                                                                            .usuariosModalidade
                                                                            .contains(currentUserReference)) {
                                                                          logFirebaseEvent(
                                                                              'Image_backend_call');

                                                                          await rowModalidadesRecord
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'usuariosModalidade': FieldValue.arrayUnion([
                                                                                  currentUserReference
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        }
                                                                      },
                                                                      onDoubleTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SEU_UNIVERSO_Image_wxh5gn62_ON_DOUBLE_TA');
                                                                        logFirebaseEvent(
                                                                            'Image_backend_call');

                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'MinhasModalidades': FieldValue.arrayRemove([
                                                                                rowModalidadesRecord.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        if (!rowModalidadesRecord
                                                                            .usuariosModalidade
                                                                            .contains(currentUserReference)) {
                                                                          logFirebaseEvent(
                                                                              'Image_backend_call');

                                                                          await rowModalidadesRecord
                                                                              .reference
                                                                              .update({
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'usuariosModalidade': FieldValue.arrayRemove([
                                                                                  currentUserReference
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              const Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              const Duration(milliseconds: 500),
                                                                          imageUrl: (currentUserDocument?.minhasModalidades.toList() ?? []).contains(rowModalidadesRecord.reference)
                                                                              ? rowModalidadesRecord.fotos
                                                                              : rowModalidadesRecord.fotospb,
                                                                          width:
                                                                              70.0,
                                                                          height:
                                                                              70.0,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    rowModalidadesRecord
                                                                        .modalidades,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 15.0, 5.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: ((_model.textFieldNomeController
                                                                        .text ==
                                                                    '') ||
                                                            (_model.textFielApelidoController
                                                                        .text ==
                                                                    ''))
                                                        ? null
                                                        : () async {
                                                            logFirebaseEvent(
                                                                'SEU_UNIVERSO_SALVAR_DADOS_COMPLEMENTAR_B');
                                                            logFirebaseEvent(
                                                                'Button_backend_call');

                                                            await currentUserReference!
                                                                .update(
                                                                    createUserRecordData(
                                                              displayName: _model
                                                                  .textFieldNomeController
                                                                  .text,
                                                              displayApelido: _model
                                                                  .textFielApelidoController
                                                                  .text,
                                                              aniversario: _model
                                                                  .datePicked,
                                                            ));
                                                            if ((valueOrDefault(currentUserDocument?.assinatura, 0) == 1) ||
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.assinatura,
                                                                        0) ==
                                                                    2) ||
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.assinatura,
                                                                        0) ==
                                                                    3) ||
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.assinatura,
                                                                        0) ==
                                                                    4)) {
                                                              logFirebaseEvent(
                                                                  'Button_navigate_to');

                                                              context.pushNamed(
                                                                  'DrawerMenu');

                                                              return;
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Button_backend_call');

                                                              await currentUserReference!
                                                                  .update(
                                                                      createUserRecordData(
                                                                assinatura: 1,
                                                              ));
                                                              logFirebaseEvent(
                                                                  'Button_navigate_to');

                                                              context.pushNamed(
                                                                  'DrawerMenu');

                                                              return;
                                                            }
                                                          },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '13rspcnh' /* Salvar Dados Complementar */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.save,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsets.all(0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      disabledColor:
                                                          const Color(0x40558BF8),
                                                      disabledTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
