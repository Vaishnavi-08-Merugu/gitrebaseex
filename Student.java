public class Student {
    public static void main(String[] args) {
        System.out.println("=== Student Program Started ===");

        String name = "Vaishnavi";
        int roll = 123;
        double marks = 86.5;

        System.out.println("Name: " + name);
        System.out.println("Roll Number: " + roll);
        System.out.println("Marks: " + marks);

        // produce a sample output file
        try (java.io.PrintWriter out = new java.io.PrintWriter("student_output.txt")) {
            out.println("Student: " + name);
            out.println("Roll: " + roll);
            out.println("Marks: " + marks);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("=== Student Program Finished ===");
    }
}
