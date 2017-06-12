<%@page import="br.com.munif.ooweb.Lugar"%>
<jsp:useBean class="br.com.munif.ooweb.Jogador" id="jogador" scope="session"/>
<jsp:useBean class="br.com.munif.ooweb.Mapa" id="mapa" scope="application"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = request.getParameter("nome");
    String movimento = request.getParameter("movimento");
    String mensagem = request.getParameter("mensagem");
    if (nome != null) {
        jogador.setNome(nome);
        jogador.setLugar(mapa.getLugarInicialJogador());
    }
    Lugar lc = jogador.getLugar();
    if (mensagem != null && mensagem.trim().length() > 0) {
        lc.getMensagens().add(jogador.getNome() + ":" + mensagem);
    }

    if (movimento != null && movimento.trim().length() > 0) {
        int opcao = Integer.parseInt(movimento);
        if (opcao == 1 && lc.getLeste() != null) {
            jogador.setLugar(lc.getLeste());
        } else if (opcao == 2 && lc.getOeste() != null) {
            jogador.setLugar(lc.getOeste());
        } else if (opcao == 3 && lc.getNorte() != null) {
            jogador.setLugar(lc.getNorte());
        } else if (opcao == 4 && lc.getSul() != null) {
            jogador.setLugar(lc.getSul());
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Jogo 2017</title>
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="jumbotron">
        <h2>Seja Bem Vindo <%=jogador.getNome()%></h2>
        <img src="casa3.png" alt="" width="250" height="150" />
        <%lc = jogador.getLugar();%>

        <h4>Você está no(a):<%=jogador.getLugar().getDescricao()%></h4>
        <h4>Com:<%=jogador.getLugar().getPersonagens()%></h4>
        <h4>Mensagens<%=jogador.getLugar().getMensagens()%></h4>
        </div>
        <form method="POST" action="principal.jsp" class="navbar-form navbar-left" >
        <div>
            <%if (lc.getLeste() != null) {
                //out.println("1) Para leste " + lc.getLeste().getDescricao());
                %><button type="submit" class="btn btn-primary" value="1" name="movimento" >►</button><%
            }%>
            
            <%if (lc.getOeste() != null) {
                //out.println("2) Para Oeste " + lc.getOeste().getDescricao());
            %><button type="submit" class="btn btn-primary" value="2" name="movimento" >◄</button><%
            }%>
            
            <%if (lc.getNorte() != null) {
                //out.println("3) Para Norte " + lc.getNorte().getDescricao());
            %><button type="submit" class="btn btn-primary" value="3" name="movimento" >▲</button><%
            }%>

            <%if (lc.getSul() != null) {
                //out.println("4) Para Sul " + lc.getSul().getDescricao());
            %><button type="submit" class="btn btn-primary" value="4" name="movimento" >▼</button><%
            }%>
        </div>
        
         <div class="form-group">
             <br><br>
            <!--Movimento:<input type="text" name="movimento" value="" class="form-control" /><br/>-->
            Mensagem:<input type="text" name="mensagem" value="" class="form-control" />
            <input type="submit" class="btn btn-primary" value="Enviar" />
         </div>
        </form>
</body>
</html>
