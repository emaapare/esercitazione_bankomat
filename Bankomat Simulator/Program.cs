﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace BankomatSimulator
{
    class Program
    {
        static SortedList<int, Banca> banche;

        /// <summary>
        /// Funzione di inizializzazione del Bankomat Simulator.
        /// </summary>
        private static void Inizializza()
        {
            var ctx = new soluzione_bankomatEntities();
            banche = new SortedList<int, Banca>();
            
            foreach(var b in ctx.Banche) 
            {
             
            
            }
            //{
                
            //    { 1, new Banca() {
            //        Nome = "Credit Agricole",
            //        Utenti = new List<Utente>{
            //            new Utente {NomeUtente = "Filippo" , Password = "123",contoCorrente = new ContoCorrente { IdContoCorrente = 100023, Saldo = 1000.90} },
            //            new Utente {NomeUtente = "Federica", Password = "x",contoCorrente = new ContoCorrente { IdContoCorrente = 0002320,Saldo = 750.00}}
            //        },
            //        ElencoFunzionalita = new SortedList<int,Banca.Funzionalita> {
            //           { 1, Banca.Funzionalita.Versamento }
            //        }
            //    } },
            //    { 2, new Banca() {
            //        Nome = "Che Banca!" ,
            //        Utenti = new List<Utente>{
            //            new Utente {NomeUtente = "Marco" , Password = "x",contoCorrente = new ContoCorrente {IdContoCorrente = 1498124, Saldo = 3502.30}},
            //            new Utente {NomeUtente = "Giulia", Password = "9999",contoCorrente = new ContoCorrente {IdContoCorrente = 220668, Saldo = 2000}}
            //        },
            //        ElencoFunzionalita = new SortedList<int,Banca.Funzionalita> {
            //            { 1, Banca.Funzionalita.Versamento },
            //            { 2, Banca.Funzionalita.ReportSaldo }
            //        }
            //    } },
            //    { 3, new Banca() { Nome = "Intesa San Paolo" ,

            //        Utenti = new List<Utente>{
            //            new Utente {NomeUtente = "Elisa" , Password = "x",contoCorrente = new ContoCorrente {IdContoCorrente = 0971283, Saldo = 10230.10}},
            //            new Utente {NomeUtente = "Andrea", Password = "1111",contoCorrente = new ContoCorrente {IdContoCorrente = 2734764, Saldo = 5020.20}}
            //        },
            //        ElencoFunzionalita = new SortedList<int,Banca.Funzionalita> {
            //            { 1, Banca.Funzionalita.Versamento },
            //            { 2, Banca.Funzionalita.Prelievo }
            //        }
            //    } },
            //    { 4, new Banca() { Nome = "BPM",
            //        Utenti = new List<Utente>{
            //            new Utente {NomeUtente = "Dario" , Password = "x",contoCorrente = new ContoCorrente {IdContoCorrente = 1526474, Saldo = 8030.14}},
            //            new Utente {NomeUtente = "Luca", Password = "x", contoCorrente = new ContoCorrente {IdContoCorrente = 2485623, Saldo = 550 }}
            //        },
            //        ElencoFunzionalita = new SortedList<int,Banca.Funzionalita> {
            //            { 1, Banca.Funzionalita.Versamento },
            //            { 2, Banca.Funzionalita.ReportSaldo},
            //            { 3, Banca.Funzionalita.Prelievo }
            //        }
            //    } },
            //    {
            //       5,new Banca() { Nome = "Fineco",
            //        Utenti = new List<Utente>{
            //            new Utente {NomeUtente = "Martina" , Password = "1000",contoCorrente = new ContoCorrente {IdContoCorrente = 2642813, Saldo = 2340.2} },
            //            new Utente {NomeUtente = "Andrea", Password = "x", contoCorrente = new ContoCorrente { IdContoCorrente = 3485683,Saldo = 989.10 }}
            //        },
            //        ElencoFunzionalita = new SortedList<int,Banca.Funzionalita> {
            //            { 1, Banca.Funzionalita.Versamento },
            //            { 2, Banca.Funzionalita.ReportSaldo},
            //            { 3, Banca.Funzionalita.Prelievo }

            //        }
            //       }
            //    }

            //};

        }
        static void Main(string[] args)
        {
            var ctx = new soluzione_bankomatEntities();
            Inizializza();
            InterfacciaUtente interfacciaUtente = new InterfacciaUtente();
            interfacciaUtente.Esegui();
        }
    }
}
