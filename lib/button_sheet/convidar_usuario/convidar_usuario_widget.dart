import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'convidar_usuario_model.dart';
export 'convidar_usuario_model.dart';

class ConvidarUsuarioWidget extends StatefulWidget {
  const ConvidarUsuarioWidget({
    super.key,
    required this.docChampion,
  });

  final ChampionRecord? docChampion;

  @override
  State<ConvidarUsuarioWidget> createState() => _ConvidarUsuarioWidgetState();
}

class _ConvidarUsuarioWidgetState extends State<ConvidarUsuarioWidget> {
  late ConvidarUsuarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConvidarUsuarioModel());

    _model.tFpesquisaController ??= TextEditingController();
    _model.tFpesquisaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          color: Colors.transparent,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 550.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/fundo_transparente.png',
                ).image,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: FlutterFlowTheme.of(context).info,
                  offset: const Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).info,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CONVIDAR_USUARIO_Icon_2e0u2v0t_ON_TAP');
                          logFirebaseEvent('Icon_navigate_back');
                          context.safePop();
                        },
                        child: Icon(
                          Icons.keyboard_return,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.tFpesquisaController,
                            focusNode: _model.tFpesquisaFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.tFpesquisaController',
                              const Duration(milliseconds: 500),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                't2ttk11l' /* Selecionar Atletas */,
                              ),
                              alignLabelWithHint: false,
                              hintText: FFLocalizations.of(context).getText(
                                '96cdvpgb' /* Adicionar Atletas */,
                              ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelLarge,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(8.0),
                              suffixIcon: _model
                                      .tFpesquisaController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.tFpesquisaController?.clear();
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontWeight: FontWeight.w600,
                                ),
                            validator: _model.tFpesquisaControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 24.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).info,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<List<UserRecord>>(
                            stream: queryUserRecord(
                              queryBuilder: (userRecord) =>
                                  userRecord.orderBy('display_name'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 10.0,
                                    height: 10.0,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<UserRecord> listViewUserRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewUserRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewUserRecord =
                                      listViewUserRecordList[listViewIndex];
                                  return Visibility(
                                    visible: valueOrDefault<bool>(
                                      functions.strFiltraNome(
                                          _model.tFpesquisaController.text,
                                          listViewUserRecord.displayName),
                                      true,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CONVIDAR_USUARIO_Row_potxi3qo_ON_TAP');
                                        if (_model.listaUsuarioSelecionado
                                            .contains(
                                                listViewUserRecord.reference)) {
                                          logFirebaseEvent(
                                              'Row_update_component_state');
                                          setState(() {
                                            _model
                                                .removeFromListaUsuarioSelecionado(
                                                    listViewUserRecord
                                                        .reference);
                                          });
                                        } else {
                                          logFirebaseEvent(
                                              'Row_update_component_state');
                                          setState(() {
                                            _model.addToListaUsuarioSelecionado(
                                                listViewUserRecord.reference);
                                          });
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 31.0,
                                            height: 31.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'CONVIDAR_USUARIO_CircleImage_29kpzed3_ON');
                                                logFirebaseEvent(
                                                    'CircleImage_expand_image');
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: CachedNetworkImage(
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
                                                          listViewUserRecord
                                                              .photoUrl,
                                                          'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                      allowRotation: false,
                                                      tag: valueOrDefault<
                                                          String>(
                                                        listViewUserRecord
                                                            .photoUrl,
                                                        'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png' '$listViewIndex',
                                                      ),
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: valueOrDefault<String>(
                                                  listViewUserRecord.photoUrl,
                                                  'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png' '$listViewIndex',
                                                ),
                                                transitionOnUserGestures: true,
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      listViewUserRecord
                                                          .photoUrl,
                                                      'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 8.0, 2.0, 8.0),
                                              child: Text(
                                                listViewUserRecord.displayName
                                                    .maybeHandleOverflow(
                                                  maxChars: 15,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CONVIDAR_USUARIO_CircleImage_kit65bh7_ON');
                                              logFirebaseEvent(
                                                  'CircleImage_expand_image');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 500),
                                                      imageUrl:
                                                          listViewUserRecord
                                                              .photoFeder,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: listViewUserRecord
                                                        .photoFeder,
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag:
                                                  listViewUserRecord.photoFeder,
                                              transitionOnUserGestures: true,
                                              child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: const Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: const Duration(
                                                      milliseconds: 500),
                                                  imageUrl: listViewUserRecord
                                                      .photoFeder,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 0.0, 3.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'CONVIDAR_USUARIO_CircleImage_8pqghyvn_ON');
                                                logFirebaseEvent(
                                                    'CircleImage_expand_image');
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: CachedNetworkImage(
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            listViewUserRecord
                                                                .photoClub,
                                                        fit: BoxFit.contain,
                                                      ),
                                                      allowRotation: false,
                                                      tag: listViewUserRecord
                                                          .photoClub,
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: listViewUserRecord
                                                    .photoClub,
                                                transitionOnUserGestures: true,
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 500),
                                                    imageUrl: listViewUserRecord
                                                        .photoClub,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (_model.listaUsuarioSelecionado
                                              .contains(
                                                  listViewUserRecord.reference))
                                            Icon(
                                              Icons.check_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 24.0,
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_model.listaUsuarioSelecionado.isNotEmpty)
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CONVIDAR_USUARIO_ADICIONAR_CONVIDADOS_BT');
                                  logFirebaseEvent(
                                      'Button_update_component_state');
                                  setState(() {
                                    _model.index = 0;
                                  });
                                  while (_model.index <
                                      _model.listaUsuarioSelecionado.length) {
                                    logFirebaseEvent('Button_backend_call');

                                    await widget.docChampion!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'Participante':
                                              FieldValue.arrayUnion([
                                            _model.listaUsuarioSelecionado[
                                                _model.index]
                                          ]),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'Button_update_component_state');
                                    setState(() {
                                      _model.index = _model.index + 1;
                                    });
                                  }
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Foram adicionados ${_model.listaUsuarioSelecionado.length.toString()} Atletas a lista de Inscritos',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  );
                                  logFirebaseEvent('Button_bottom_sheet');
                                  Navigator.pop(
                                      context, _model.listaUsuarioSelecionado);
                                },
                                text: FFLocalizations.of(context).getText(
                                  '0w7v78rq' /* Adicionar Convidados */,
                                ),
                                icon: const Icon(
                                  Icons.group_add,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).info,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                          ],
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
    );
  }
}
