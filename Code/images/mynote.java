import java.awt.*;
import java.io.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;
import java.text.*;
import javax.swing.event.*;
import javax.swing.undo.*;
import javax.swing.text.*;
import javax.swing.KeyStroke.*;
import java.awt.Color;
import java.lang.*;

/** THIS PROGRAM IS AN ER TO QUERY CONVERTER
 *  @author Shashank*/

public class mynote extends JFrame implements ActionListener
{
 Container c;
 MenuBar mb;
 Menu m1,m2,m3,m4,m5,m6;
 MenuItem m1i1,m1i2,m1i3,m1i4,m1i5,m1i6,m1i7,m1i8,m1i9;
 MenuItem m2i1,m2i2,m2i3,m2i4,m2i5,m2i6,m2i7,m2i9,m2i10,m2i11,m2i12,m2i13;
 MenuItem m3i1,m3i2;
 MenuItem m4i1,m4i2;
 MenuItem m5i1;
 MenuItem m6i1,m6i2;
 CheckboxMenuItem m2i8;
  UIManager.LookAndFeelInfo xx[];
 JTextArea ta;
 String s="",s1,str,str1;
 String syntax="vaavs \n[\ndatabase DATABASENAME  \n \n struct ENTITY1 entitytype \n { \n ATTRIBUTE1  integer  pkey ; \n ATTRIBUTE2  integer  pkey ; \n ATTRIBUTE3 float  unique ; \n ATTRIBUTE4 number  23 34 ; \n ATTRIBUTE5 number 1 2 mulv;\n } \n struct ENTITY2 entitytype\n { \n ATTRIBUTE1 integer  pkey;\n ATTRIBUTE2   float;\n ATTRIBUTE3 integer mulv;\n	}\n struct RELATION1 relationtype\n	{\n	ATTRIBUTE1 integer  ;\n	}\n relation RELATIONSHIP1 \n {\n ENTITY1 ARITY ; \n ENTITY2 weak ARITY;\n }\n relation RELATIONSHIP2 identify\n {\n ENTITY1 totpart  3; \n ENTITY2 totpart 4;\n}\n]";
String msg="";
 File f1,f2,f3;
 MenuShortcut msc;
 int flag=0,v,h;
 int x,y,i=0;
 File f;
 FileOutputStream fos;
 FileInputStream fis;
 byte b[]=new byte[20];
 String line="";
 DateFormat df,df1;
 Date d;
 JScrollPane jsp;
  int fileflag=0;
String filename;
TextArea outLabel = new TextArea("",20,80);
 private UndoManager undo = new UndoManager();

 mynote()
 {
  try
{
   xx=UIManager.getInstalledLookAndFeels();
        UIManager.setLookAndFeel(xx[1].getClassName());}catch(Exception q){}
 c=getContentPane();
  c.setLayout(null);//
  MyWindowAdapter adapter=new MyWindowAdapter(this);
  addWindowListener(adapter);
  ta=new JTextArea(s,80,80);
  c. add(ta);
  jsp=new JScrollPane(ta);
  c.add(jsp);
  
  outLabel.setVisible(false);		
  setTitle("VAAVS-ER TO QUERY GENERATOR");
  msc=new MenuShortcut(79);
  mb=new MenuBar();
  m1=new Menu("File");
  m2=new Menu("Edit");
  m3=new Menu("Search");
  m4=new Menu("About us");
  m5=new Menu("Execute");
  m6=new Menu("Syntax");

  m1i1=new MenuItem("New");
  m1i2=new MenuItem("Open");
  m1i8=new MenuItem("-");
  m1i9=new MenuItem("-");
  m1i3=new MenuItem("Save");
  m1i4=new MenuItem("Save As..");
  m1i5=new MenuItem("Page Setup");
  m1i6=new MenuItem("Print");
  m1i7=new MenuItem("Exit");
  m1.add(m1i1); m1.add(m1i2); m1.add(m1i3); m1.add(m1i4);m1.add(m1i8);m1.add(m1i5);m1.add(m1i6); m1.add(m1i9);m1.add(m1i7);


  m2i10=new MenuItem("-");
  m2i11=new MenuItem("-");
  m2i12=new MenuItem("-");
  m2i1=new MenuItem("Undo");
  m2i13=new MenuItem("Redo");
  m2i2=new MenuItem("Cut     Ctrl+x");
  m2i3=new MenuItem("Copy    Ctrl+c");
  m2i4=new MenuItem("Paste   Ctrl+v");
  m2i5=new MenuItem("Delete  Del");
  m2i6=new MenuItem("Select All");
  m2i7=new MenuItem("Time/Date F5");
  m2i8=new CheckboxMenuItem("WordWrap");
  m2i9=new MenuItem("Set Font...");
   m2.add(m2i1); m2.add(m2i13); m2.add(m2i10);m2.add(m2i2); m2.add(m2i3); m2.add(m2i4); m2.add(m2i5);m2.add(m2i11);m2.add(m2i6);m2.add(m2i7);m2.add(m2i12);m2.add(m2i8);m2.add(m2i9);

  m3i1=new MenuItem("Find...");
  m3i2=new MenuItem("FindNext F3");
  m3.add(m3i1); m3.add(m3i2);

  m4i1=new MenuItem("About VAAVS DEVELOPER");
  m4i2=new MenuItem("About VERSION");
  m4.add(m4i1); m4.add(m4i2);

  m5i1=new MenuItem("Execute");
  m5.add(m5i1);

  m6i1=new MenuItem("Show Syntax");
  m6i2=new MenuItem("KeyNotes");
  m6.add(m6i1);
  m6.add(m6i2);
  mb.add(m1);mb.add(m2);mb.add(m3);mb.add(m4);mb.add(m5);mb.add(m6);
  setMenuBar(mb);

  m1i1.addActionListener(this);
  m1i2.addActionListener(this);
  m1i3.addActionListener(this);
  m1i4.addActionListener(this);
  m1i7.addActionListener(this);

  m2i1.addActionListener(this);
  m2i13.addActionListener(this);
  m2i2.addActionListener(this);
  m2i3.addActionListener(this);
  m2i4.addActionListener(this);
  m2i5.addActionListener(this);
  m2i6.addActionListener(this);
  m2i7.addActionListener(this);
  m2i8.addActionListener(this);
  m2i9.addActionListener(this);

  m3i1.addActionListener(this);
  m3i2.addActionListener(this);

  m4i1.addActionListener(this);
  m4i2.addActionListener(this);

  m5i1.addActionListener(this);

  m6i1.addActionListener(this);
  m6i2.addActionListener(this);
  
    Document doc = ta.getDocument();
    doc.addUndoableEditListener(new UndoableEditListener() {
    public void undoableEditHappened(UndoableEditEvent evt) {
    undo.addEdit(evt.getEdit());
  }
  });
  ta.setWrapStyleWord(false);
  setSize(1050,1000);
  setVisible(true);
  }
	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	private void initialize() {
        this.setSize(170, 80);
			
	}
    public String getExtension(String  f) {
        if(f != null) {
            int extensionIndex = f.lastIndexOf('.');
	    if(extensionIndex < 0) {
		return null;
	    }
            return f.substring(extensionIndex+1).toLowerCase();
	}
	return null;
    }
  public void actionPerformed(ActionEvent ae)
  {
    if(ae.getSource()==m1i2)
    {
     FileDialog fd=new FileDialog(this,"Open",FileDialog.LOAD);
     fd.setVisible(true);
     s=fd.getFile();
     setTitle(s+"- SAVED E-R DATA MODEL IN VAAVS");
     str=fd.getDirectory();
     str1=(fd.getDirectory()+fd.getFile());
     s1=getExtension(s);

     try
     {
      FileReader fr=new FileReader(str1);
      BufferedReader br=new BufferedReader(fr);
      while((line=br.readLine())!=null)
      {
       ta.append(line+"\n");
      }
     }
     catch(Exception e){}
    }
    if(ae.getSource()==m1i3)
    {
     DataInputStream dis;
     try
     {
      if(fileflag==0)
      {
     FileDialog fd=new FileDialog(this,"Save",FileDialog.SAVE);
     fd.setVisible(true);
     s=fd.getFile();
     filename=s;
     str1=fd.getDirectory()+fd.getFile();
     setTitle(s+"- SAVED E-R DATA MODEL IN VAAVS");
     System.out.println(filename);
     fileflag=1;
     }
     s1="";
     s1=ta.getText();
     FileWriter fw=new FileWriter(filename);
     StringReader sr=new  StringReader(s1);
     BufferedReader br=new BufferedReader(sr);
     String lr="";
     while((lr=br.readLine())!=null)
     {
      fw.write(lr+"\r\n");
     }
      fw.close();
       }catch(Exception pe){setTitle("UNTITLED.txt");}
     }
    if(ae.getSource()==m1i4)
    {
     FileDialog fd=new FileDialog(this,"Save As",FileDialog.SAVE);
     fd.setVisible(true);
     s=fd.getFile();
     filename=s;
     setTitle(s+" - NOTEPAD");
      DataInputStream dis;
     str1=fd.getDirectory()+fd.getFile();
      try
      {
     s1="";
     s1=ta.getText();
     FileWriter fw=new FileWriter(filename);
     StringReader sr=new  StringReader(s1);
     BufferedReader br=new BufferedReader(sr);
     String lr="";
     while((lr=br.readLine())!=null)
     {
      fw.write(lr+"\r\n");
     }
      fw.close();

       fileflag=1;
       }catch(Exception pe){}
    }
    if(ae.getSource()==m1i7)
    {
     System.exit(0);
    }
    if(ae.getSource()==m1i1)
    {
     s="";
    ta.setText(s);
    setTitle("UNTITLED-VAAVS E-R TO QUERY CONVERTER");
	fileflag=0;
	filename="";

    }
    if(ae.getSource()==m2i1)
    {
        try {
              if (undo.canUndo())
              {
              undo.undo();
           }
      } catch (CannotUndoException e) {   }
    }
    if(ae.getSource()==m2i9)
    {

          myfont  myfon=new myfont(this);
    }
  if(ae.getSource()==m2i13)
    {
     try {
           if (undo.canRedo())
            {
             undo.redo();
          }
   } catch (CannotRedoException e) { }
  }
    if(ae.getSource()==m2i2)
    {
     s=ta.getSelectedText();
     ta.cut();
    }
    if(ae.getSource()==m3i2)
    {

search sear=new search(this);
    }

    if(ae.getSource()==m2i3)
    {
     s=ta.getSelectedText();
     ta.copy();
    }
    if(ae.getSource()==m2i4)
    {
     s=ta.getSelectedText();
     ta.paste();
    }
    if(ae.getSource()==m2i6)
    {
     ta.selectAll();
    }

    if(ae.getSource()==m2i5)
    {
     x=ta.getSelectionStart();
     y=ta.getSelectionEnd();
     ta.replaceRange(" ",x,y);
   }
    if(ae.getSource()==m2i8)
    {
      if(ta.getWrapStyleWord()==false)
      {
     ta.setWrapStyleWord(true);
     System.out.println("wordwrap is set");
     }
     else
     {
      ta.setWrapStyleWord(false);
      System.out.println("wordwrap is not set");
    }
   }
   if(ae.getSource()==m2i7)
   {
    d=new Date();
         df=DateFormat.getDateInstance(DateFormat.MEDIUM);
         df1=DateFormat.getTimeInstance(DateFormat.MEDIUM);

    str= df.format(d);
    str1=df1.format(d);

    ta.setText(str+"   "+str1);
   }
   if(ae.getSource()==m3i1)
   {
    search sear=new search(this);
   }
   if(ae.getSource()==m4i1)
   {

  
    JOptionPane.showMessageDialog(null,"Developed by Venkat Rao,Abhinav Meherotra,Shashank Handa,Abhijeet Rao,Vikram Jain VASAV,IIITB ","",JOptionPane.INFORMATION_MESSAGE);
    //dev d = new dev(this);
    Msgbox("devlop");
    //help1 hel=new help();
   //RuntimeExecApp r2 = new RuntimeExecApp();
  // new1 n1 = new new1();
   }
   if(ae.getSource()==m4i2)
   {
    s="This program is developed by VASAV,IIITB ";
    //help2 hel=new help();
    JOptionPane.showMessageDialog(null,"Version 1.0 ","",JOptionPane.INFORMATION_MESSAGE);
   
   }
if(ae.getSource()==m5i1)
   {
	outLabel.setVisible(true);

	Container content = this.getContentPane();
	c.add(outLabel);
	//c.add(ta);
	//ta.setBounds(0,0,1050,450);
	outLabel.setBounds(0,450,1010,200);
	JScrollPane tsp = new JScrollPane(outLabel);
	//tsp.setBorder(BorderFactory.createEmptyBorder(10,5,10,5));
	c.add(tsp, null);
        //this.pack();
	Runtime r =Runtime.getRuntime();
	Process p = null;
try{
        
	 String ls_str;
	//r.exec("ls");
	//System.out.println(r.exec("ls"));
	r.exec("bison -d ersql.y");
	r.exec("flex ersql.l");
	r.exec("gcc lex.yy.c ersql.tab.c -lfl -o output");
	
	Process ls_proc = r.exec("./output first.ersql > abhi");
	DataInputStream ls_in = new DataInputStream(
        ls_proc.getInputStream());

	//line ="";    
	try {
		while ((ls_str = ls_in.readLine()) != null) {
		    
		    line = line + ls_str +"\n";	
		}
	    } catch (IOException e) {
		System.exit(0);
	    }
	} catch (IOException e1) {
	    System.err.println(e1);
	    System.exit(1);
	}
	
	outLabel.setEditable(false);
        outLabel.setText(line);
	
	

}




if(ae.getSource()==m6i1)
{
	JOptionPane.showMessageDialog(null,syntax,"",JOptionPane.INFORMATION_MESSAGE);

}
if(ae.getSource()==m6i2)
{
    JOptionPane.showMessageDialog(null,"Key Notes\n\n pkey   Primary Key\n unique   Unique Attribute\n mulv   Multivalued Attribute \n weak   Weak Entity \n identify   Identifying Relationship \n totpart   Total Participation","",JOptionPane.INFORMATION_MESSAGE);
}  
  }
  /*
 * @param string
 */
private void Msgbox(String string) {
	// TODO Auto-generated method stub
	
}
public static void main(String a[])
  {
   new mynote();
  }
}  //  @jve:decl-index=0:visual-constraint="185,38"
class MyWindowAdapter extends WindowAdapter
{
 mynote mynote;
 MyWindowAdapter(mynote mynote)
 {
  this.mynote=mynote;
 }
 public void windowClosing(WindowEvent we)
 {

  System.exit(0);
 }
}
class myfont extends Dialog implements ActionListener,ItemListener
{
 GraphicsEnvironment ge;
 java.awt.List l1,l2,l3;
 Button b1,b2;
 Font f1[];
 String f[];
 int i,j;
 mynote mynote;
 TextField tf1,tf2,tf3;
Label ll1,ll2,ll3;
 String fn;
int fs,fsize;
 public myfont(mynote myno)
 {
	super(myno,"Font",true);

  setLayout(null);

mynote=myno;

  ge=GraphicsEnvironment.getLocalGraphicsEnvironment();
  l1=new java.awt.List();
  l2=new java.awt.List();
  l3=new java.awt.List();
  b1=new Button("OK");
  b2=new Button("CANCEL");
tf1=new TextField(10);
tf2=new TextField(10);
tf3=new TextField(10);
ll1=new Label("Font");
ll2=new Label("Font Style");
ll3=new Label("Size");
	ll1.setBounds(20,60,100,20);
	add(ll1);
	tf1.setBounds(20,80,100,20);
	add(tf1);
        l1.setBounds(20,100,100,150);
        add(l1);
	ll2.setBounds(140,60,100,20);
	add(ll2);
	tf2.setBounds(140,80,100,20);
	add(tf2);
   l2.setBounds(140,100,100,150);
  add(l2);
	ll3.setBounds(260,60,100,20);
	add(ll3);

	tf3.setBounds(260,80,100,20);
	add(tf3);

       l3.setBounds(260,100,100,150);
  add(l3);

	b1.setBounds(380,70,80,20);
  add(b1);
	b2.setBounds(380,95,80,20);
  add(b2);

  f=ge.getAvailableFontFamilyNames();

  for(i=0;i<f.length;i++)
  {
   l1.add(f[i]);
   }

    l2.add("Regular");
l2.add("Bold");
l2.add("Italic");
l2.add("BoldItalic");
   for(i=8;i<=72;i+=2)
	  l3.add(String.valueOf(i));

   b2.addActionListener(this);
   b1.addActionListener(this);
l1.addItemListener(this);
l2.addItemListener(this);
l3.addItemListener(this);
   setSize(480,280);
setResizable(false);
   setVisible(true);

 }


 public void actionPerformed(ActionEvent fe)
 {
  if(fe.getSource()==b2)
  {
   dispose();
    }

  if(fe.getSource()==b1)
	{

	mynote.ta.setFont(new Font(fn,fs,fsize));
	dispose();
	}
   }

public void itemStateChanged(ItemEvent ie)
	{

	 if(ie.getSource()==l1)
	  {
   tf1.setText(l1.getSelectedItem());
	fn=tf1.getText();
	   }

	if(ie.getSource()==l2)
	    {
        tf2.setText(l2.getSelectedItem());
	    if(tf2.getText().equals("Bold"))
		  fs=Font.BOLD;

	     else
                if(tf2.getText().equals("Italic"))
		    fs=Font.ITALIC;
	   else
		if(tf2.getText().equals("BoldItalic"))
		      fs=Font.BOLD+Font.ITALIC;
	     else
		    fs=Font.PLAIN;

	if(tf2.getText()=="")
	{
	 tf2.setText("Regular");
 	 fs=Font.PLAIN;
	}
	    }

	if(ie.getSource()==l3)
	  {

	 tf3.setText(l3.getSelectedItem());
	  fsize=Integer.parseInt(tf3.getText());
              if(tf3.getText()=="")
		{
  			fsize=8;
		}
               }
	}
}


class search extends Frame implements ActionListener
{
 TextField tf;
 Button b3,b4;
 Checkbox up,dn,mc;
 CheckboxGroup cbg;
 Label l1;
 mynote mynote;
 String s,s1;
 int l,k,si,ei,i=0;
StringBuffer sb;
public  search(mynote mynote)
 { setTitle("Find");

this.mynote=mynote;
  l1=new Label("Find");
  tf=new TextField(30);
  b3=new Button("FindNext..");
  b4=new Button("Cancel");
  cbg=new CheckboxGroup();
  up=new Checkbox("up",cbg,false);
  dn=new Checkbox("down",cbg,true);
  mc=new Checkbox("Match Case");
  setLayout(null);
   l1.setBounds(20,60,100,20);
   add(l1);
                    tf.setBounds(20,80,100,20);
   add(tf);
   b3.setBounds(140,60,100,20);
   add(b3);
   b4.setBounds(140,90,100,20);
   add(b4);
   mc.setBounds(10,120,90,10);
   add(mc);
  //setBackground(Color.BLUE);
setSize(300,200);
setVisible(true);
b3.addActionListener(this);
b4.addActionListener(this);

  }
public void actionPerformed(ActionEvent e1)
  {

   if(e1.getSource()==b4)
   {
    dispose();
   }
   if(e1.getSource()==b3)
   {
   s=mynote.ta.getText();
    l=s.length();
 sb=new StringBuffer(s);
    s1=tf.getText();
    k=s1.length();
    //si=sb.indexOf(s1);
    ei=si+(k);
    mynote.ta.select(si,ei);
     }
   }
 }
/*class help extends Frame implements ActionListener
{
 TextArea l;
 Button b;
 mynote mynote;
 help(mynote mynote)
 { setLayout(null);
  this.mynote=mynote;
  l=new TextArea(mynote.s,100,100);
  b=new Button("CLOSE");
  add(l);
  b.setBounds(30,70,70,20);
  add(b);
  b.addActionListener(this);
 }
 public void actionPerformed(ActionEvent ae2)
 {
  if(ae2.getSource()==b)
  {
   dispose();
  }
 }
}*/
